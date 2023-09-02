

import 'package:flutter/material.dart';

enum DeviceScreenType {
  Mobile,
  Tablet,
  Desktop
}

class SizingInformation {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}

double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

bool isMobile(context) =>getWidth(context)<800;

double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}