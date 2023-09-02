import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';

class OButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final bool isWhite;
  const OButton({
    super.key,
    required this.onClick,  
    required this.text,
    this.isWhite = false
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(    
        side: isWhite? const BorderSide(
          color: ColorsConst.white,
        ) : null,
        foregroundColor: isWhite ? ColorsConst.white: null
      ),
      onPressed: onClick, child: Text(text));
  }
}