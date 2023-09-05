import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {

  go(route, {Object? args})=>Navigator.of(this).pushNamed(route, arguments: args);
  
  erasedGo(route)=>Navigator.of(this).pushNamedAndRemoveUntil(route, (route) => false);

  back({Object? value})=>Navigator.pop(this, value);

  openBottomSheet(Widget widget)=>showModalBottomSheet(context: this, builder: (_)=>widget);

  openDialog(Widget widget)=>showDialog(context: this, builder: (_)=>widget);

}