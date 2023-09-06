import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class SiteService {

  createSite({
    required String name, 
    required String status,
    required String templateId,
    required String resumeId
  })async{
    final response = await ApiClient(ApisConst.site, loader: false).post(
      {
        "name": name,
        "status": status,
        "templateId": templateId,
        "resumeId": resumeId
      }
    );
    return response;
  }

}