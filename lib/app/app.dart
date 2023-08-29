import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/resources/app_style.dart';
import 'package:portfolio_builder_ai/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: BotToastInit(),
      routerConfig: router,
      theme: AppStyle.getApplicationTheme('light'),
      debugShowCheckedModeBanner: false,
    );
  }
}
