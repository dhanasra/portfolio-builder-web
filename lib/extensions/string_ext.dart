import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension StringModify on String {

  String firstLetter()=>substring(0, 1);

}

extension DateString on String {

  String convertToTime(String format)=>DateFormat(format).format(DateTime.parse(this));

}

extension StringToText on String {

  headlineLarge(BuildContext context, {Color? color})=>Text(this, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: color));
  headlineMedium(BuildContext context, {Color? color})=>Text(this, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: color));
  
  titleLarge(BuildContext context, {Color? color, bool isCenter = false,})=>Text(
    this, textAlign: isCenter ? TextAlign.center : null, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: color));
  
  headlineSmall(BuildContext context, {Color? color, bool isCenter = false,})=>Text(
    this, textAlign: isCenter ? TextAlign.center : null, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: color));

  bodySmall(BuildContext context, {Color? color, bool isCenter = false, bool isBold = false, double? height})=>Text(
    this, 
    textAlign: isCenter ? TextAlign.center : null,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
      height: height,
      color: color, fontWeight: isBold ? FontWeight.w800 : null));

  bodyMedium(BuildContext context, {Color? color, bool isBold = true, TextAlign? align, double? height})=>Text(
    this, textAlign: align, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color, height: height, fontWeight: !isBold ? FontWeight.w400 : null));

  bodyLarge1(BuildContext context, {Color? color, bool isBold = false})=>Text(
    this, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      color: color,
      fontSize: 24,
      fontWeight: isBold ? FontWeight.w800 : null
    ));

  bodyLarge(BuildContext context, {Color? color, bool isBold = false, TextAlign? align, double? height})=>Text(
    this, textAlign: align, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      color: color,
      height: height,
      fontWeight: isBold ? FontWeight.w800 : null
    ));

  labelLarge(BuildContext context, {Color? color, bool isBold = false})=>Text(
    this, style: Theme.of(context).textTheme.labelLarge!.copyWith(
      color: color,
      fontWeight: isBold ? FontWeight.w800 : null
    ));

  labelMedium(BuildContext context, {Color? color, bool isBold = false})=>Text(
    this, style: Theme.of(context).textTheme.labelMedium!.copyWith(
      color: color,
      letterSpacing: 0.5,
      height: 1.6,
      fontWeight: isBold ? FontWeight.w800 : null
    ));


}

extension TextEditingControllerTrim on TextEditingController {

  String trim()=>text.trim();

  double toDouble()=>text.trim().isNotEmpty ? double.parse(double.parse(text.trim()).toStringAsFixed(2)) : 0.00;

}