import 'package:flutter/material.dart';

class OButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  const OButton({
    super.key,
    required this.onClick,  
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onClick, child: Text(text));
  }
}