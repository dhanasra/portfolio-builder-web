import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/presentation/splash/splash_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/splash_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    SplashViewModel(context).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConst.background,
      body: Center(
        child: SplashLogo(),
      ),
    );
  }
}