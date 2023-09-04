import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/presentation/authentication/bloc/auth_bloc.dart';
import 'package:portfolio_builder_ai/presentation/authentication/pages/signin_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/b_container.dart';
import 'package:portfolio_builder_ai/widgets/splash_logo.dart';

import '../../../constants/assets_const.dart';
import '../../../constants/colors_const.dart';
import '../../../widgets/bs_container.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late SignInViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SignInViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state)=>_viewModel.handleState(state),
      child: Scaffold(
        body: Container(
          color: ColorsConst.background,
          alignment: Alignment.center,
          child: BSContainer(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SplashLogo(),
                  24.height(),
                  'Sign In / Sign Up'.headlineSmall(context),
                  8.height(),
                  SizedBox(
                      width: 100,
                      child: Divider(
                        thickness: 4,
                        color: Theme.of(context).primaryColor,
                      )),
                  30.height(),
                  'Supercharge Your Resume with AI: Effortlessly Craft Impressive Portfolios in Just 60 Seconds! Land Your Dream Job Today.'
                      .bodySmall(context, height: 1.6, isCenter: true),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Image.asset(
                      AssetsConst.signin,
                      width: 200,
                    ),
                  ),
                  'Continue With'.bodySmall(context),
                  30.height(),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () =>
                                _viewModel.signInClick(SignInWithGoogle()),
                            borderRadius: BorderRadius.circular(4),
                            child: BContainer(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(FontAwesomeIcons.google,
                                        color: ColorsConst.error2, size: 20),
                                    10.width(),
                                    'Google'.bodyMedium(context)
                                  ],
                                )),
                          ),
                        ),
                      ),
                      30.width(),
                      Expanded(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () =>
                                _viewModel.signInClick(SignInWithGithub()),
                            borderRadius: BorderRadius.circular(4),
                            child: BContainer(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.github,
                                      size: 20,
                                    ),
                                    10.width(),
                                    'Github'.bodyMedium(context)
                                  ],
                                )),
                          ),
                        ),
                      ),
                      30.width(),
                      Expanded(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () =>
                                _viewModel.signInClick(SignInWithLinkedIn()),
                            borderRadius: BorderRadius.circular(4),
                            child: BContainer(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(FontAwesomeIcons.linkedinIn,
                                        color: ColorsConst.tertiary1, size: 20),
                                    10.width(),
                                    'Linked In'.bodyMedium(context)
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
