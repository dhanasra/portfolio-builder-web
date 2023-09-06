class ApisConst {

  ApisConst._();

  static String apiHost = "https://ra4agw2n12.execute-api.us-east-1.amazonaws.com/dev/";

  static String aiHost = "http://54.211.154.176:3000/";

  // auth paths
  static const String authenticate = 'authenticate';

  // token paths
  static const String accessToken = 'accessToken';

  // resume api paths
  static const String resumeParse = 'parse-pdf';
  static const String resumeSchema = 'resume-schema';

  static const String resume = 'resume';
  static const String resumeGetUsers = 'user-resumes';
  static const String resumeGetAll = 'resumes';

  // site api paths

  static const String site = 'site';



}