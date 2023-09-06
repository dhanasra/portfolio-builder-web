import 'package:portfolio_builder_ai/database/local_db.dart';

import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class TokenService {

  final ApiClient _client = ApiClient(ApisConst.accessToken, loader: false);

  getToken()async{
    final response = await _client.post(
      {
        'refreshToken': LocalDB.getRefreshToken()
      }
    );
    return response;
  }


}