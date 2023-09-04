import 'package:flutter/material.dart';

class BContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final double radius;
  const BContainer({
    super.key,
    this.padding,
    this.margin,
    this.radius = 4,
    required this.child  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: Theme.of(context).dividerColor
        )
      ),
      child: child,
    );
  }
}