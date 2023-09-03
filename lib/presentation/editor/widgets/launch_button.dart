import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';

import '../../../constants/colors_const.dart';
import '../../../constants/shadow_const.dart';

class LaunchButton extends StatelessWidget {
  const LaunchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          boxShadow: ShadowConst.light(context),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Material(
          color: ColorsConst.primary,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Launch', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    height: 1,
                    color: ColorsConst.white
                  ),),
                  8.width(),
                  const Icon(Icons.play_arrow, size: 20,)
                ],
              )
            ),
          ),
        ),
      )
    );
  }
}