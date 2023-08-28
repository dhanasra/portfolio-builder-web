import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

import '../resources/validators.dart';
import 'icon_button_switch.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool floatingLabel;
  final bool defaultMargin;
  final bool required;
  final bool underline;
  final bool noPadding;
  final bool isPassword;
  final int? maxLines;
  final bool numberOnly;
  final ValueChanged? onChanged;
  final BoxConstraints? constraints;
  final IconData? endIcon;
  final IconData? startIcon;
  final bool validateEmail;
  final bool validatePassword;


  const InputField({
    super.key,
    required this.controller,
    this.labelText,
    this.maxLines,
    this.hintText,
    this.constraints,
    this.onChanged,
    this.endIcon,
    this.startIcon,
    this.numberOnly = false,
    this.noPadding = false,
    this.underline = false,
    this.required = true,
    this.floatingLabel = true,
    this.isPassword = false,
    this.defaultMargin = false,
    this.validateEmail = false,
    this.validatePassword = false
  });

  @override
  Widget build(BuildContext context) {

    if(isPassword){
      ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
      return ValueListenableBuilder<bool>(
        valueListenable: passwordNotifier, 
        builder: (_, val, __){
          return field(!val, onPasswordChanged: (v) => passwordNotifier.value = v);
        });
    }else if(floatingLabel){
      return field(false);
    }else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ("$labelText ${required ? '*' : ''}").bodySmall(context),
          12.height(),
          field(false)
        ],
      );
    }

  }

  Widget field(obscureText, {ValueChanged? onPasswordChanged}){
    return Padding(
      padding: defaultMargin 
        ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
      child: TextFormField(
        maxLines: obscureText? 1:maxLines,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged!=null ? (v)=>onChanged!(v) : null,
        validator: required 
          ? validateEmail 
          ? (val)=>Validators.validateEmail(val, labelText??'Email Address')
          : validatePassword
          ? (val)=>Validators.validatePassword(val, labelText??'Password')
          : (val)=>Validators.isNotNullOrEmpty(val, labelText??'Field')
          : null,
        inputFormatters: [
            if(numberOnly)
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
        ],
        keyboardType: numberOnly ? const TextInputType.numberWithOptions(decimal: true) : null,
        decoration: InputDecoration(
          contentPadding: noPadding ? const EdgeInsets.all(0) : null,
          constraints: constraints,
          labelText: floatingLabel && labelText!=null && labelText!.isNotEmpty 
            ? "$labelText ${required ? '*' : ''}" : null,
          floatingLabelBehavior: floatingLabel 
            ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
          hintText: hintText,
          prefixIcon: startIcon!=null ? Icon(startIcon!, size: 18,) : null,
          prefixIconConstraints: underline ? const BoxConstraints(maxHeight: 30) : null,
          suffixIconConstraints: underline ? const BoxConstraints(maxHeight: 30) : null,
          enabledBorder: underline ? const UnderlineInputBorder() : null,
          focusedBorder: underline ? const UnderlineInputBorder() : null,
          suffixIcon: isPassword 
            ? IconButtonSwitch(
                preIcon: Icons.remove_red_eye_outlined,
                postIcon: Icons.remove_red_eye,
                onChanged: onPasswordChanged!
              )
            : endIcon!=null
            ? Icon(endIcon, size: 18,)
            : null
        )
      ),
    );
  }
}