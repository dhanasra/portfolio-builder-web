import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';

class TButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final bool isWhite;
  final bool styled;
  const TButton({
    super.key,
    required this.onClick,  
    required this.text,
    this.isWhite = false,
    this.styled = false
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isWhite ? ColorsConst.white : null,
          textStyle: styled ? GoogleFonts.poly(
            fontSize: 16
          ): null
        ),
        onPressed: onClick, child: Text(text));
  }
}