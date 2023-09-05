import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/apis_const.dart';
import '../../database/local_db.dart';
import '../../widgets/toast.dart';

class ApiClient {
  late Dio dio;

  final String path;
  final bool loader;
  final bool errToast;

  final Map<String, String>? additionalHeaders;

  ApiClient(this.path, {this.loader=true, this.errToast=true,this.additionalHeaders, bool isAICall = false, bool isAuthCall = false}){
    dio = Dio();
    dio.options.baseUrl = isAICall ? ApisConst.aiHost : ApisConst.apiHost;
    dio.interceptors.add(ApiInterceptors(
      dio: dio, 
      additionalHeaders: additionalHeaders,
      loader: loader,
      errToast: errToast
    ));
  }

  Future<dynamic> gets([Map<String, dynamic>? query]) async {
    return _process(await dio.get(path, queryParameters: query));
  }

  Future<dynamic> post([dynamic data = const {}, Map<String, dynamic>? query]) async {
    return _process(await dio.post(path, data: data));
  }

  Future<dynamic> put([dynamic data = const {}, Map<String, dynamic>? query]) async {
    return _process(await dio.put(path, data: data));
  }

  Future<dynamic> delete([dynamic data = const {}, Map<String, dynamic>? query]) async {
    return _process(await dio.delete(path, data: data));
  }

  _process(Response response){
    return response.data['data'];
  }
}

class ApiInterceptors extends Interceptor {
  final Dio dio;
  final Map<String, String>? additionalHeaders;
  final bool loader;
  final bool errToast;

  ApiInterceptors({
    required this.dio,
    required this.additionalHeaders,
    required this.errToast,
    required this.loader  
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    if (loader) showLoader();

    // var idToken = LocalDB.getAccessToken();

    // if (idToken != null) options.headers["Authorization"] = "Bearer $idToken";
    options.headers["Content-Type"] = "application/json";

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if (loader) hideLoader();

    
    if(err.response?.statusCode==401){
      // var data = await TokenService().getToken();
      // LocalDB.saveAccessToken(data['accessToken']);
      // LocalDB.saveRefreshToken(data['newRefreshToken']);

      try {
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      } 
    } 

    if (err.response?.data is Map && err.response!.data.containsKey('message')) {
      if (errToast) toast(err.response?.data['message'], success: false);
    } else {
      if (errToast) toast('Something went wrong !', success: false);
    }

    if(err.response?.statusCode==401){
      return;
    }else {
      return handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    if (loader) hideLoader();

    if(response.data!=null){

      var data = response.data['data'];
      if((data is Map && data['accessToken']!=null) && (data['refreshToken']!=null)){
        await LocalDB.saveAccessToken(data['accessToken']);
        await LocalDB.saveRefreshToken(data['refreshToken']);
      }
      
      if(response.data['status']=='success'){
        return handler.next(response);
      }
    }
  }

}