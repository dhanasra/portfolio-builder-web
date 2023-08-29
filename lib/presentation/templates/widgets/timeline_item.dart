import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

import '../../../constants/colors_const.dart';

class TimeLineItem extends StatelessWidget {
  final String dateTime;
  final String text;
  final bool reverse;
  const TimeLineItem({
    super.key,
    required this.dateTime,
    required this.reverse,
    required this.text  
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: reverse
                ? [
                  
                  SizedBox(
                    width: 400,
                    child: dateTime.bodyLarge(context, color: ColorsConst.white, align: TextAlign.left),
                  ),
                  30.width(),
                  const VerticalDivider(),
                  30.width(), 
                  SizedBox(
                    width: 400,
                    child: Container(
                        decoration: BoxDecoration(
                          color: ColorsConst.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        padding: const EdgeInsets.all(20),
                        child: text.bodySmall(context),
                      ),
                  )
                ].reversed.toList()
              :[
                  
                  SizedBox(
                    width: 400,
                    child: dateTime.bodyLarge(context, color: ColorsConst.white, align: TextAlign.right),
                  ),
                  30.width(),
                  const VerticalDivider(),
                  30.width(), 
                  SizedBox(
                    width: 400,
                    child: Container(
                        decoration: BoxDecoration(
                          color: ColorsConst.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        padding: const EdgeInsets.all(20),
                        child: text.bodySmall(context),
                      ),
                  )
                ],
              ),
            ),
        const SizedBox(
          height: 80,
          child: VerticalDivider()
        ),
      ],
    );
  }
}