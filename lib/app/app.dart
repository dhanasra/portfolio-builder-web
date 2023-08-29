import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/presentation/resume/bloc/resume_bloc.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_view.dart';
import 'package:portfolio_builder_ai/resources/app_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: AppStyle.getApplicationTheme('light'),
      debugShowCheckedModeBanner: false,
      home: BlocProvider (
        create: (context) => ResumeBloc(),
        child: const ResumeUploadView(),
      ),
    );
  }
}
