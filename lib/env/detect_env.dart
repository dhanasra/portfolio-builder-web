


import 'env_init.dart';

class EnvUtil {
  static Future<Env> detectEnv() {
    return (Uri.base.host == 'localhost')
        ? Future.value(Env.dev)
        : (Uri.base.host.contains('portfolio-builder-57d7d.web.app'))
        ? Future.value(Env.dev)
        : (Uri.base.host.contains('staging-recruiter.turbotalent.ai'))
        ? Future.value(Env.staging) 
        : (Uri.base.host.contains('recruiter.turbotalent.ai'))
        ? Future.value(Env.prod)
        : Future.value(Env.prod);
  }
}
