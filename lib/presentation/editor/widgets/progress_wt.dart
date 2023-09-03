import 'package:flutter/material.dart';

class CircularProgressWithText extends StatelessWidget {
  final double value;

  const CircularProgressWithText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[

        CircularProgressIndicator(
          value: value,
          strokeWidth: 2.0,
        ),

        Text(
          '${(value * 100).toStringAsFixed(0)}%', 
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}