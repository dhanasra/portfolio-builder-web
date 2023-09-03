import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

import '../../../constants/colors_const.dart';
import '../../../constants/icons_const.dart';

class SectionListItem extends StatelessWidget {
  final String section;
  final bool isSelected;
  final VoidCallback onTap;
  final bool hideSideNav;
  const SectionListItem({
    super.key,
    required this.isSelected,
    required this.section,
    required this.onTap,
    this.hideSideNav = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !hideSideNav
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4) : EdgeInsets.zero,
      child: Material(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hideSideNav?0:4)
          ),
          selectedTileColor: ColorsConst.primary,
          selected: isSelected,
          tileColor: ColorsConst.white,
          selectedColor: ColorsConst.white,
          onTap: ()=>onTap(),
          leading: Icon(IconsConst.getSectionIcon(section), size: 16,),
          title: !hideSideNav 
            ? section.bodySmall(context, color: isSelected ? ColorsConst.white : ColorsConst.text) : null,
        ),
      ),
    );
  }
}