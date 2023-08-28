import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';

class ExpandedRow extends StatelessWidget {
  final List<Widget> children;
  final int gap;

  const ExpandedRow({
    super.key,
    required this.children,
    this.gap = 0
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: gap==0 
      ? children.map(
        (e) => Expanded(child: e)).toList()
      : getWidgets()
    );
  }

  getWidgets(){
    List<Widget> finalList = [];
    for (var i = 0; i < ((2*children.length)-1); i++) {
      if(i%2!=0){
        finalList.add(gap.width());
      }else{
        finalList.add(Expanded(
          child:children[(i~/2)]));
      }
    }
    return finalList;
  }
}