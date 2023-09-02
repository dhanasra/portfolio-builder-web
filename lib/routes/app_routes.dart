import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_view.dart';
import 'package:portfolio_builder_ai/presentation/templates/pages/template_view.dart';

import '../presentation/resume/bloc/resume_bloc.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
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
        return const TemplateView(
          // schema: state.extra as ResumeSchema,
        );
      },
    ),
  ],
);
