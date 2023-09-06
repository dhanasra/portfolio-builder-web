import '../../constants/apis_const.dart';
import '../clients/api_client.dart';

class AIService {

  final ApiClient _client = ApiClient(ApisConst.resumeSchema, loader: false, isAICall: true);

  getResumeSchema(String content)async{
    final response = await _client.post(
      {
        'content': content
      }
    );
    return response;
  }


}