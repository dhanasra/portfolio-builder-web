import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/app/app.dart';
import 'package:url_strategy/url_strategy.dart';

import 'env/detect_env.dart';
import 'env/env_init.dart';
import 'firebase/options.dart';
import 'global.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Global.appEnv = AppEnv.fromEnv(await EnvUtil.detectEnv());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(Global.appEnv!.env));
  await FirebaseAuth.instance.authStateChanges().first;
  setPathUrlStrategy();

  runApp(const App());
}