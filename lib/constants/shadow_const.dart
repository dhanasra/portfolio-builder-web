import 'package:flutter/material.dart';

class ShadowConst {

  ShadowConst._();

  static splashShadow(color)=> [BoxShadow(color: color, blurRadius: 25, offset: const Offset(0, 0))];

  static normal(context)=> [
    BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.2), blurRadius: 4, offset: const Offset(3, 0))];
  
  static light(context)=> [
    BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 4, offset: const Offset(0, 0))];

}