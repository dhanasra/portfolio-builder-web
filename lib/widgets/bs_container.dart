import 'package:flutter/material.dart';

import '../constants/shadow_const.dart';

class BSContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final bool removeDecoration;
  const BSContainer({
    super.key,
    this.padding,
    this.margin,
    this.removeDecoration = false,
    required this.child  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      constraints: const BoxConstraints(
        maxWidth: 800
      ),
      decoration: removeDecoration ? null : BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: ShadowConst.light(context),
        borderRadius: BorderRadius.circular(2)
      ),
      child: child,
    );
  }
}