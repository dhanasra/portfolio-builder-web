import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:get/get.dart';
import 'package:portfolio_builder_ai/presentation/authentication/bloc/auth_bloc.dart';
import 'package:portfolio_builder_ai/presentation/authentication/pages/signin_view.dart';
import 'package:portfolio_builder_ai/presentation/editor/cubits/schema_cubit.dart';
import 'package:portfolio_builder_ai/presentation/editor/pages/template_editor/template_editor_view.dart';
import 'package:portfolio_builder_ai/presentation/resume/bloc/resume_bloc.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_view.dart';
import 'package:portfolio_builder_ai/routes/middlewares/auth_must_middleware.dart';

import '../presentation/splash/splash_view.dart';
import 'middlewares/auth_middleware.dart';


class Routes {

    static const String splash = '/';
    static const String signin = '/signin';
    static const String uploadResume = '/upload-resume';
    static const String template = '/template';
    static const String templateEditor = '/template-editor';
}


Future<bool> signout() async {
  await FirebaseAuth.instance.signOut();
  return true;
}

class RouteGenerator {
  static List<GetPage> pages = [
    // Welcome Screens

    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      transition: nav.Transition.noTransition,
    ),

    GetPage(
        name: Routes.signin,
        page: () => BlocProvider(
              create: (context) => AuthBloc(),
              child: const SignInView(),
            ),
        middlewares: [
          AuthMiddleware()
        ],
        transition: nav.Transition.noTransition),

    GetPage(
        name: Routes.uploadResume,
        page: () => BlocProvider(
            create: (_) => ResumeBloc(), 
            child: const ResumeUploadView()
        ),
        middlewares: [
          AuthMustMiddleware()
        ],
        transition: nav.Transition.noTransition),

    GetPage(
        name: Routes.templateEditor,
        page: () => BlocProvider(
          create: (_)=>SchemaCubit(),
          child: const TemplateEditorView(),  
        ),
        middlewares: [
          AuthMustMiddleware()
        ],
        transition: nav.Transition.noTransition),
  ];
}