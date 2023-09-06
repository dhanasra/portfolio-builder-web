import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';

import '../../../../responsive/responsive_row_expanded.dart';
import '../../../../widgets/e_button.dart';
import '../../../../widgets/form_wav.dart';
import '../../../../widgets/input_field.dart';


class ProjectFields extends StatelessWidget {
  final ValueNotifier<List<Project>> projects;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController highLightController;
  final TextEditingController technologiesController;
  final TextEditingController urlController;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> mode;
  final Project? project;

  const ProjectFields({
    super.key,
    required this.projects,
    required this.urlController,
    required this.technologiesController,
    required this.nameController,
    required this.descriptionController,
    required this.endDateController,
    required this.highLightController,
    required this.startDateController,
    required this.autovalidateMode,
    required this.mode,
    required this.formKey,
    this.project
  });

  @override
  Widget build(BuildContext context) {

    nameController.text = project?.name??'';
    descriptionController.text = project?.description??'';
    startDateController.text = project?.startDate??'';
    endDateController.text = project?.endDate??'';
    technologiesController.text = project?.technologiesUsed?.join(',')??'';
    urlController.text = project?.url??'';
    
    int index = -1;

    if(project!=null){
      index = projects.value.indexOf(project!);
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
              labelText: 'Description',
              defaultMargin: true,
              maxLines: 6,
              controller: descriptionController
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
              labelText: 'Technologies Used',
              defaultMargin: true,
              required: false,
              controller: technologiesController
            ),
            InputField(
              labelText: 'Highlights',
              defaultMargin: true,
              required: false,
              controller: highLightController
            ),
            InputField(
              labelText: 'Project Link',
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

                var newProject = Project(
                  name: nameController.trim(),
                  description: descriptionController.trim(),
                  technologiesUsed: technologiesController.trim().split(','),
                  startDate: startDateController.trim(),
                  endDate: endDateController.trim(),
                  url: urlController.trim()
                );
                if(project==null){
                  projects.value=[ ...projects.value, newProject ];
                }else{
                  projects.value[index] = newProject;
                }
                projects.notifyListeners();
                mode.value = false;
              }, 
              text: 'Add Project'
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