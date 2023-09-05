import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class AuthService {

  createUser({required String firstName,required String lastName,required String email,required String uid, String? picture})async{
    final response = await ApiClient( ApisConst.authenticate, loader: false).post(
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
}