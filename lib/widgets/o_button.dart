import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';

class OButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final bool isWhite;
  final double? maxWidth;
  const OButton({
    super.key,
    required this.onClick,  
    this.maxWidth,
    required this.text,
    this.isWhite = false
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(    
        maximumSize: maxWidth!=null ? Size(maxWidth!, 50) : null,
        side: isWhite? const BorderSide(
          color: ColorsConst.white,
        ) : null,
        foregroundColor: isWhite ? ColorsConst.white: null
      ),
      onPressed: onClick, child: Text(text));
  }
}