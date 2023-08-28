import 'package:flutter/material.dart';

import '../constants/colors_const.dart';

class EButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color? bgColor;
  final bool rounded;
  const EButton({
    super.key,
    required this.onClick,
    this.bgColor,
    this.rounded = false,
    required this.text  
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: bgColor!=null ? MaterialStatePropertyAll(bgColor) : null,
        foregroundColor: bgColor!=null ? const MaterialStatePropertyAll(ColorsConst.primary) : null,
        shape: rounded ? MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ) : null
      ),
      onPressed: onClick, 
      child: Text(text));
  }
}