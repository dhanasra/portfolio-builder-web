import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class AuthService {

  createUser({required String firstName,required String lastName,required String email,required String uid, String? picture})async{
    final response = await ApiClient(ApisConst.apiHostAuth, loader: false).post(
      {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "uid": uid,
        "picture": picture
      }
    );
    return response;
  }

  getResumeSchema(String content)async{
    final response = await ApiClient(ApisConst.resumeSchema, loader: false, isAICall: true).post(
      {
        'content': content
      }
    );
    return response;
  }

}