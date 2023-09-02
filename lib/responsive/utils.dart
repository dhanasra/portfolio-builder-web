

import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if(deviceWidth<360){
    return DeviceScreenType.Mobile;
  }else{
    return DeviceScreenType.Desktop;
  }
}