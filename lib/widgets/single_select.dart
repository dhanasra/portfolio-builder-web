import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

import '../resources/validators.dart';

class SingleSelect extends StatelessWidget {
  final String? value;
  final String? labelText;
  final String? hintText;
  final List<String> options;
  final ValueChanged onChanged;
  final bool floatingLabel;
  final bool defaultMargin;
  final bool required;


  const SingleSelect({
    super.key,
    this.labelText,
    this.hintText,
    this.value,
    required this.options,
    required this.onChanged,
    this.required = true,
    this.floatingLabel = true,
    this.defaultMargin = false
  });

  @override
  Widget build(BuildContext context) {

    if(floatingLabel){
      return field(context);
    }else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ("$labelText ${required ? '*' : ''}").bodySmall(context),
          12.height(),
          field(context)
        ],
      );
    }

  }

  Widget field(context){
    return Padding(
      padding: defaultMargin 
        ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: floatingLabel && labelText!=null && labelText!.isNotEmpty 
            ? "$labelText ${required ? '*' : ''}" : hintText,
          floatingLabelBehavior: floatingLabel 
            ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
          hintText: hintText,
        ),
        validator: required 
          ? (val)=>Validators.isNotNullOrEmpty(val, labelText??'Field')
          : null,
        items: options.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e))
        ).toList(), 
        onChanged: (v)=>onChanged(v)
      )
    );
  }
}