import 'package:flutter/material.dart';

class FormWAV extends StatelessWidget {
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final Widget child;
  const FormWAV({
    super.key,
    required this.autovalidateMode,
    required this.child,
    required this.formKey  
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: autovalidateMode, 
      builder: (_, val, __){
        return Form(
          autovalidateMode: val,
          key: formKey,
          child: child);
      });
  }
}