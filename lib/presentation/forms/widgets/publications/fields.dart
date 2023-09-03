import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';

import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class PublicationFields extends StatelessWidget {
  final ValueNotifier<List<Publication>> publications;

  final TextEditingController nameController;
  final TextEditingController releaseDateController;
  final TextEditingController publisherController;
  final TextEditingController summaryController;
  final TextEditingController urlController;

  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Publication? publication;

  const PublicationFields({
    super.key,
    required this.publications,
    required this.nameController,
    required this.releaseDateController,
    required this.publisherController,
    required this.summaryController,
    required this.urlController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.publication
  });

  @override
  Widget build(BuildContext context) {

    nameController.text = publication?.name??'';
    releaseDateController.text = publication?.releaseDate??'';
    publisherController.text = publication?.publisher??'';
    urlController.text = publication?.url??'';
    summaryController.text = publication?.summary??'';
    
    int index = -1;

    if(publication!=null){
      index = publications.value.indexOf(publication!);
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
              labelText: 'Publisher',
              defaultMargin: true,
              controller: publisherController
            ),
            InputField(
              labelText: 'Link',
              defaultMargin: true,
              required: false,
              controller: urlController
            ),
            InputField(
              labelText: 'Release Date',
              defaultMargin: true,
              required: false,
              controller: releaseDateController
            ),
            InputField(
              labelText: 'Summary',
              defaultMargin: true,
              required: false,
              maxLines: 6,
              controller: summaryController
            ),

            16.height(),
        
            EButton(
              onClick: (){

                if(!formKey.currentState!.validate()){
                  autovalidateMode.value = AutovalidateMode.onUserInteraction;
                  return;
                }

                var newProject = Publication(
                  name: nameController.trim(),
                  publisher: publisherController.trim(),
                  releaseDate: releaseDateController.trim(),
                  summary: summaryController.trim(),
                  url: urlController.trim(),
                );

                if(publication==null){
                  publications.value.add(newProject);
                }else{
                  publications.value[index] = newProject;
                }
                publications.notifyListeners();
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