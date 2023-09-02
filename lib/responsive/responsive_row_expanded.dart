import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';
import 'package:portfolio_builder_ai/responsive/utils.dart';

class ResponsiveRowExpanded extends StatelessWidget {
  final List<Widget> children;
  final bool addGap;
  final CrossAxisAlignment rowCrossAxisAlignment;
  const ResponsiveRowExpanded({
    super.key,
    required this.children,
    this.addGap = false,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    
    bool isMobile = getDeviceType(MediaQuery.of(context)) == DeviceScreenType.Mobile;

    return isMobile 
    ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.map((e){
        return e;
      }).toList()
    )
    : Row(
      crossAxisAlignment: rowCrossAxisAlignment,
      children: children.map((e){
        return addGap 
        ? children.indexOf(e)%2!=0 
          ? e 
          : Expanded(child: e)
        : Expanded(child: e);
      }).toList()
    );
  }
}