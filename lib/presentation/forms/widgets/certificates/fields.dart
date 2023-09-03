import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';

import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class CertificateFields extends StatelessWidget {
  final ValueNotifier<List<Certificate>> certificates;

  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController issuerController;
  final TextEditingController urlController;

  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Certificate? certificate;

  const CertificateFields({
    super.key,
    required this.certificates,
    required this.nameController,
    required this.dateController,
    required this.issuerController,
    required this.urlController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.certificate
  });

  @override
  Widget build(BuildContext context) {

    nameController.text = certificate?.name??'';
    dateController.text = certificate?.date??'';
    issuerController.text = certificate?.issuer??'';
    urlController.text = certificate?.url??'';
    
    int index = -1;

    if(certificate!=null){
      index = certificates.value.indexOf(certificate!);
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
              labelText: 'Issuer',
              defaultMargin: true,
              controller: issuerController
            ),
            InputField(
              labelText: 'Date',
              defaultMargin: true,
              required: false,
              controller: dateController
            ),
            InputField(
              labelText: 'Certificate Link',
              defaultMargin: true,
              required: false,
              controller: urlController
            ),

            16.height(),
        
            EButton(
              onClick: (){

                if(!formKey.currentState!.validate()){
                  autovalidateMode.value = AutovalidateMode.onUserInteraction;
                  return;
                }

                var newProject = Certificate(
                  name: nameController.trim(),
                  date: dateController.trim(),
                  issuer: issuerController.trim(),
                  url: urlController.trim(),
                );

                if(certificate==null){
                  certificates.value.add(newProject);
                }else{
                  certificates.value[index] = newProject;
                }
                certificates.notifyListeners();
                mode.value = false;
              }, 
              text: 'Add Award'
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