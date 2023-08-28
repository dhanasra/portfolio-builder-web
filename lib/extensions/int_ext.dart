import 'package:flutter/material.dart';

extension Sizing on int {

  Widget height()=>SizedBox(height: toDouble());
  Widget width()=>SizedBox(width: toDouble());

}

extension DoubleCalculations on double {

  double roundOff2()=>double.parse(toStringAsFixed(2));

}