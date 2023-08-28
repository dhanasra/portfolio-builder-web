import 'package:flutter/material.dart';

class ShadowConst {

  ShadowConst._();

  static splashShadow(color)=> [BoxShadow(color: color, blurRadius: 25, offset: const Offset(0, 0))];

  static normal(context)=> [
    BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.4), blurRadius: 4, offset: const Offset(0, 0))];

}