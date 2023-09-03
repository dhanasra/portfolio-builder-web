import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/award.dart';

import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class AwardFields extends StatelessWidget {
  final ValueNotifier<List<Award>> awards;

  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController awarderController;
  final TextEditingController summaryController;

  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Award? award;

  const AwardFields({
    super.key,
    required this.awards,
    required this.titleController,
    required this.dateController,
    required this.awarderController,
    required this.summaryController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.award
  });

  @override
  Widget build(BuildContext context) {

    titleController.text = award?.title??'';
    dateController.text = award?.date??'';
    awarderController.text = award?.awarder??'';
    summaryController.text = award?.summary??'';
    
    int index = -1;

    if(award!=null){
      index = awards.value.indexOf(award!);
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
              labelText: 'Title',
              defaultMargin: true,
              controller: titleController
            ),
            InputField(
              labelText: 'Awarder',
              defaultMargin: true,
              controller: awarderController
            ),
            InputField(
              labelText: 'Date',
              defaultMargin: true,
              required: false,
              controller: dateController
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

                var newProject = Award(
                  title: titleController.trim(),
                  date: dateController.trim(),
                  awarder: awarderController.trim(),
                  summary: summaryController.trim(),
                );

                if(award==null){
                  awards.value.add(newProject);
                }else{
                  awards.value[index] = newProject;
                }
                awards.notifyListeners();
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