import 'package:flutter/material.dart';

import '../constants/shadow_const.dart';

class BSContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  const BSContainer({
    super.key,
    this.padding,
    this.margin,
    required this.child  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor
        ),
        boxShadow: ShadowConst.light(context),
        borderRadius: BorderRadius.circular(8)
      ),
      child: child,
    );
  }
}