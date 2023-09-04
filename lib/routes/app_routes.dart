import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_builder_ai/presentation/authentication/bloc/auth_bloc.dart';
import 'package:portfolio_builder_ai/presentation/authentication/pages/signin_view.dart';
import 'package:portfolio_builder_ai/presentation/editor/pages/template_editor/template_editor_view.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_view.dart';
import 'package:portfolio_builder_ai/presentation/templates/pages/template_view.dart';

import '../network/models/resume_schema.dart';
import '../presentation/resume/bloc/resume_bloc.dart';

class Routes {

    static String uploadResume = 'upload-resume';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthBloc(),
          child: const SignInView(),
        );
      },
    ),
    GoRoute(
      path: '/upload-resume',
      name: Routes.uploadResume,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => ResumeBloc(),
          child: const ResumeUploadView(),
        );
      },
    ),
    GoRoute(
      path: '/template',
      name: 'template',
      builder: (BuildContext context, GoRouterState state) {
        return TemplateView(
          schema: state.extra as ResumeSchema,
        );
      },
    ),
    GoRoute(
      path: '/template-editor',
      name: 'template-editor',
      builder: (BuildContext context, GoRouterState state) {
        return const TemplateEditorView(
          
        );
      },
    ),
  ],
);
