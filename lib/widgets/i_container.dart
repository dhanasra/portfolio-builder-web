import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

class IContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool network;
  final String? image;
  final String? text;
  final double? width;
  final double? height;
  final File? file;
  final double aspectRatio;

  const IContainer({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.file,
    this.height,
    this.network = false,
    this.image,
    this.text,
    this.aspectRatio = 600/280
  });

  @override
  Widget build(BuildContext context) {
    return width!=null
    ? SizedBox(
      width: width,
      height: height,
      child: child(context)
    ) 
    : AspectRatio(
      aspectRatio: aspectRatio,
      child: child(context)
    );
  }

  Widget child(context){
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).dividerColor
        ),
        color: ColorsConst.primary,
        image: text==null 
          ? DecorationImage(
          fit: BoxFit.fill,
          image: file!=null
            ? FileImage(file!)
            : network 
            ? NetworkImage(image!)
            : AssetImage(image!) as ImageProvider )
          : null
      ),
      alignment: Alignment.center,
      child: text!=null
        ? text!.bodyMedium(context, color: ColorsConst.white) : null,
    );
  }
}