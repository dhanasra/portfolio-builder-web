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

  getResumeSchema(String content)async{
    final response = await ApiClient(ApisConst.resumeSchema, loader: false, isAICall: true).post(
      {
        'content': content
      }
    );
    return response;
  }

}