enum Env {
  dev,
  staging,
  prod,
}

class AppEnv {
  late final Env env;
  AppEnv._internal(this.env);
  factory AppEnv.fromEnv(Env env) => AppEnv._internal(env);

  String get baseUrl {
    switch (env) {
      case Env.dev:
        return 'https://60ccvvp5ha.execute-api.ap-south-1.amazonaws.com/dev/';
      case Env.staging:
        return 'https://ts3hhvoxmf.execute-api.ap-south-1.amazonaws.com/staging/';
      case Env.prod:
        return 'https://0422dhff24.execute-api.ap-south-1.amazonaws.com/production/';
      default:
        return 'https://60ccvvp5ha.execute-api.ap-south-1.amazonaws.com/dev/';
    }
  }
}
