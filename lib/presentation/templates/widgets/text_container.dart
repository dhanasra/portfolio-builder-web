import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

class TextContainer extends StatelessWidget {
  final String name;
  final String desc;
  const TextContainer({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 100,
        maxWidth: 300
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsConst.grey),
        borderRadius: BorderRadius.circular(8)
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          name.bodyMedium(context, color: ColorsConst.white,align: TextAlign.center, height: 1.6),
          desc.bodyMedium(context, color: ColorsConst.white,align: TextAlign.center, height: 1.6),
        ],
      ),
    );
  }
}