import 'package:flutter/material.dart';

class TButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  const TButton({
    super.key,
    required this.onClick,  
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onClick, child: Text(text));
  }
}