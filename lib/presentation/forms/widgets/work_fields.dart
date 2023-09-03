import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';

import '../../../responsive/responsive_row_expanded.dart';
import '../../../widgets/e_button.dart';
import '../../../widgets/form_wav.dart';
import '../../../widgets/input_field.dart';

class WorkFields extends StatelessWidget {
  final ValueNotifier<List<WorkExperience>> works;
  final TextEditingController jobTitleController;
  final TextEditingController employerController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController descriptionController;
  final TextEditingController achievementsController;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final WorkExperience? experience;

  const WorkFields({
    super.key,
    required this.works,
    required this.achievementsController,
    required this.descriptionController,
    required this.employerController,
    required this.endDateController,
    required this.jobTitleController,
    required this.startDateController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.experience
  });

  @override
  Widget build(BuildContext context) {

    jobTitleController.text = experience?.jobTitle??'';
    employerController.text = experience?.employer??'';
    startDateController.text = experience?.startDate??'';
    endDateController.text = experience?.endDate??'';
    descriptionController.text = experience?.description??'';
    achievementsController.text = experience?.achievements?.join(',')??'';
    
    int index = -1;

    if(experience!=null){
      index = works.value.indexOf(experience!);
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
              labelText: 'Job title',
              defaultMargin: true,
              controller: jobTitleController
            ),
            InputField(
              labelText: 'Company',
              defaultMargin: true,
              controller: employerController
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
            InputField(
              labelText: 'Description',
              defaultMargin: true,
              required: false,
              maxLines: 6,
              controller: descriptionController
            ),
            InputField(
              labelText: 'Achievements',
              required: false,
              defaultMargin: true,
              controller: achievementsController
            ),
            16.height(),
        
            EButton(
              onClick: (){

                if(!formKey.currentState!.validate()){
                  autovalidateMode.value = AutovalidateMode.onUserInteraction;
                  return;
                }

                var newExperience = WorkExperience(
                      jobTitle: jobTitleController.trim(),
                      employer: employerController.trim(),
                      startDate: startDateController.trim(),
                      endDate: endDateController.trim(),
                      description: descriptionController.trim(),
                      achievements: achievementsController.trim().split(',')
                    );
                if(experience==null){
                  works.value.add(newExperience);
                }else{
                  works.value[index] = newExperience;
                }
                works.notifyListeners();
                mode.value = false;
              }, 
              text: 'Add Experience'
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