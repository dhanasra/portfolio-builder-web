import 'package:flutter/material.dart';

import '../constants/colors_const.dart';
import '../constants/shadow_const.dart';

class CImage extends StatelessWidget {
  final double radius;
  final String image;
  final bool isNetwork;
  final bool shadow;

  const CImage({
    super.key,
    required this.radius,  
    required this.image,
    this.isNetwork = false,
    this.shadow = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2 * radius,
      height: 2 * radius,
      decoration: BoxDecoration(
        color: ColorsConst.primary,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: shadow ? ShadowConst.splashShadow(ColorsConst.primary) : null,
        image: isNetwork 
          ? DecorationImage(
            image: NetworkImage(image)
          )
          : DecorationImage(
            image: AssetImage(image)
          )
      ),
    );
  }
}