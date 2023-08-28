import 'package:flutter/material.dart';

import '../constants/colors_const.dart';
import '../constants/shadow_const.dart';

class DecoratedBG extends StatelessWidget {
  final Widget child;
  const DecoratedBG({
    super.key,
    required this.child  
  });

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: size.height,),

          Container(
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              color: ColorsConst.primary2,
              borderRadius: BorderRadius.circular(size.width),
              boxShadow: ShadowConst.splashShadow(ColorsConst.white1)
            ),
          ),
          
          Container(
            width: 175,
            height: 175,
            decoration: BoxDecoration(
              color: ColorsConst.primary1,
              borderRadius: BorderRadius.circular(90),
              boxShadow: ShadowConst.splashShadow(ColorsConst.primary1)
            ),
          ),

          child
        ]
    );
  }
}