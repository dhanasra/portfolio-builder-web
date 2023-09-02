import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';
class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment rowMainAxisAlignment;
  const ResponsiveRow({
    super.key,
    required this.children,
    this.rowMainAxisAlignment = MainAxisAlignment.spaceBetween
  });

  @override
  Widget build(BuildContext context) {
    
    bool isMobileScreen = isMobile(context);

    return isMobileScreen 
    ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.map((e){
        return e;
      }).toList()
    )
    : Row(
      mainAxisAlignment: rowMainAxisAlignment,
      children: children.map((e){
        return e;
      }).toList()
    );
  }
}