import 'package:flutter/material.dart';

class BContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  const BContainer({
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
        )
      ),
      child: child,
    );
  }
}