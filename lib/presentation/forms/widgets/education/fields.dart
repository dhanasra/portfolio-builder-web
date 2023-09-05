import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';

import '../../../../responsive/responsive_row_expanded.dart';
import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class EducationFields extends StatelessWidget {
  final ValueNotifier<List<Education>> works;
  final TextEditingController institutionController;
  final TextEditingController areaController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController studyTypeController;
  final TextEditingController scoreController;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Education? education;

  const EducationFields({
    super.key,
    required this.works,
    required this.studyTypeController,
    required this.scoreController,
    required this.areaController,
    required this.endDateController,
    required this.institutionController,
    required this.startDateController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.education
  });

  @override
  Widget build(BuildContext context) {

    institutionController.text = education?.institution??'';
    areaController.text = education?.area??'';
    startDateController.text = education?.startDate??'';
    endDateController.text = education?.endDate??'';
    scoreController.text = education?.score??'';
    studyTypeController.text = education?.studyType??'';
    
    int index = -1;

    if(education!=null){
      index = works.value.indexOf(education!);
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
              labelText: 'Institution',
              defaultMargin: true,
              controller: institutionController
            ),
            InputField(
              labelText: 'Qualification',
              defaultMargin: true,
              controller: areaController
            ),
            ResponsiveRowExpanded(
              addGap: true,
              children: [
                InputField(
                  labelText: 'Start Date',
                  defaultMargin: true,
                  controller: startDateController
                ),
                12.width(),
                InputField(
                  labelText: 'End Date',
                  defaultMargin: true,
                  controller: endDateController
                )
              ],
            ),
            ResponsiveRowExpanded(
              addGap: true,
              children: [
                InputField(
                  labelText: 'Study Type',
                  defaultMargin: true,
                  required: false,
                  controller: studyTypeController
                ),
                12.width(),
                InputField(
                  labelText: 'Score',
                  required: false,
                  defaultMargin: true,
                  controller: scoreController
                ),
              ],
            ),

            16.height(),
        
            EButton(
              onClick: (){

                if(!formKey.currentState!.validate()){
                  autovalidateMode.value = AutovalidateMode.onUserInteraction;
                  return;
                }

                var newEducation = Education(
                  institution: institutionController.trim(),
                  area: areaController.trim(),
                  startDate: startDateController.trim(),
                  endDate: endDateController.trim(),
                  studyType: studyTypeController.trim(),
                  score: scoreController.trim()
                );
                if(education==null){
                  works.value = [...works.value, newEducation];
                }else{
                  works.value[index] = newEducation;
                }
                works.notifyListeners();
                mode.value = false;
              }, 
              text: 'Add Education'
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