import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';

import '../../../constants/colors_const.dart';
import '../../../widgets/b_container.dart';

class ViewPortChanger extends StatefulWidget {
  const ViewPortChanger({super.key});

  @override
  State<ViewPortChanger> createState() => _ViewPortChangerState();
}

class _ViewPortChangerState extends State<ViewPortChanger> {

  DeviceScreenType screenType = DeviceScreenType.Desktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: ()=>setState(()=>screenType=DeviceScreenType.Desktop),
              splashRadius: 20,
              icon: Icon(
                Icons.desktop_windows_rounded, 
                color: screenType==DeviceScreenType.Desktop ? ColorsConst.primary : ColorsConst.grey),
            ),
            16.width(),
            IconButton(
              onPressed: ()=>setState(()=>screenType=DeviceScreenType.Tablet),
              splashRadius: 20,
              icon: Icon(
                Icons.tablet_android, 
                color: screenType==DeviceScreenType.Tablet ? ColorsConst.primary : ColorsConst.grey),
            ),
            16.width(),
            IconButton(
              onPressed: ()=>setState(()=>screenType=DeviceScreenType.Mobile),
              splashRadius: 20,
              icon: Icon(
                Icons.phone_iphone, 
                color: screenType==DeviceScreenType.Mobile ? ColorsConst.primary : ColorsConst.grey),
            )
          ],
        )
      ),
    );
  }
}