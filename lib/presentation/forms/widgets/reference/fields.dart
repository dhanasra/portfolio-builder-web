import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/reference.dart';
import 'package:portfolio_builder_ai/responsive/responsive_row_expanded.dart';

import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class ReferenceFields extends StatelessWidget {
  final ValueNotifier<List<Reference>> references;

  final TextEditingController nameController;
  final TextEditingController positionController;
  final TextEditingController organizationController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Reference? reference;

  const ReferenceFields({
    super.key,
    required this.references,
    required this.positionController,
    required this.organizationController,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.reference
  });

  @override
  Widget build(BuildContext context) {

    nameController.text = reference?.name??'';
    positionController.text = reference?.position??'';
    organizationController.text = reference?.organization??'';
    emailController.text = reference?.email??'';
    phoneController.text = reference?.phone??'';
    
    int index = -1;

    if(reference!=null){
      index = references.value.indexOf(reference!);
    }

    return FormWAV(
      autovalidateMode: autovalidateMode,
      formKey: formKey,
      child: Expanded(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [
            
            InputField(
              labelText: 'Name',
              defaultMargin: true,
              controller: nameController
            ),
            InputField(
              labelText: 'Position',
              defaultMargin: true,
              controller: positionController
            ),
            InputField(
              labelText: 'Organization',
              defaultMargin: true,
              controller: organizationController
            ),
            ResponsiveRowExpanded(
              addGap: true,
              children: [
                InputField(
                  labelText: 'Email Address',
                  defaultMargin: true,
                  required: false,
                  controller: emailController
                ),
                16.width(),
                InputField(
                  labelText: 'Phone Number',
                  defaultMargin: true,
                  required: false,
                  controller: phoneController
                )
              ]),
            16.height(),
        
            EButton(
              onClick: (){

                if(!formKey.currentState!.validate()){
                  autovalidateMode.value = AutovalidateMode.onUserInteraction;
                  return;
                }

                var newProject = Reference(
                  name: nameController.trim(),
                  position: positionController.trim(),
                  organization: organizationController.trim(),
                  email: emailController.trim(),
                  phone: phoneController.trim()
                );
                if(reference==null){
                  references.value = [...references.value, newProject];
                }else{
                  references.value[index] = newProject;
                }
                references.notifyListeners();
                mode.value = false;
              }, 
              text: 'Add Reference'
            ),

            const Divider(
              height: 30,
            ),
                  
          ],
        ),
      ),
    );
  }
}