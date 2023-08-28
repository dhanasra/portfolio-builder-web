import 'package:flutter/material.dart';

import 'colors_const.dart';

class GradientConst {

  GradientConst._();

  static splashShader(secondary)=>(Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: <Color>[ColorsConst.tertiary, secondary],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            };

}