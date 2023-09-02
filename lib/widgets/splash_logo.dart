import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
              return const RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: <Color>[ColorsConst.primary, ColorsConst.primary2],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
          child: const Icon(
            Icons.bolt,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
              return const RadialGradient(
                center: Alignment.topLeft,
                radius: 5.0,
                colors: <Color>[ColorsConst.primary, ColorsConst.primary2],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
          child: const Text(
            'Careers Craft',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ]
    );
  }
}