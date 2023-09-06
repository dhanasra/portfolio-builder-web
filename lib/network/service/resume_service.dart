import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class ResumeService {

  parseResumeData(String url)async{
    final response = await ApiClient(ApisConst.resumeParse, loader: false).post(
      {
        "url": url
      }
    );
    return response;
  }

  createResume({required String name, String? link, String? content,Map? schema, String? parsed})async{
    final response = await ApiClient(ApisConst.resume, loader: false).post(
      {
        "name": name,
        "link": link,
        "parsed": parsed,
        "content": content,
        "schema": schema
      }
    );
    return response;
  }

  update({required String resumeId, String? name, String? link, String? content,Map? schema})async{
    final response = await ApiClient('${ApisConst.resume}?id=$resumeId', loader: false).put(
      {
        "name": name,
        "link": link,
        "content": content,
        "schema": schema
      }
    );
    return response;
  }

  delete({required String resumeId})async{
    final response = await ApiClient('${ApisConst.resume}?id=$resumeId', loader: false).delete();
    return response;
  }

  getResume({required String resumeId})async{
    final response = await ApiClient('${ApisConst.resume}?id=$resumeId', loader: false).gets();
    return response;
  }

  getMyResumes()async{
    final response = await ApiClient(ApisConst.resumeGetUsers, loader: false).gets();
    return response;
  }

  getAllResumes()async{
    final response = await ApiClient(ApisConst.resumeGetAll, loader: false).gets();
    return response;
  }

}