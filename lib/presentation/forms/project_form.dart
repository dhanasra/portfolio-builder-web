import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/project/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/project/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../network/models/project.dart';
import '../../widgets/o_button.dart';

class ProjectForm extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<List<Project>> onChanged;
  const ProjectForm({
    super.key, 
    required this.projects,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Project>> works = ValueNotifier(projects);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Project?> edited = ValueNotifier(null);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController highLightController = TextEditingController();
    final TextEditingController technologiesController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController urlController = TextEditingController();



    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, isEdit, __) {
        return Column(
          children: [

            if(isEdit)
              ValueListenableBuilder(
                valueListenable: edited,
                builder: (_, val, __) {
                  return ProjectFields(
                    projects: works, 
                    mode: mode,
                    project: edited.value,
                    urlController: urlController, 
                    highLightController: highLightController, 
                    technologiesController: technologiesController,
                    descriptionController: descriptionController, 
                    endDateController: endDateController, 
                    nameController: nameController, 
                    startDateController: startDateController, 
                    autovalidateMode: autovalidateMode, 
                    formKey: formKey
                  );
                }
              )
            else
              ValueListenableBuilder(
                valueListenable: works,
                builder: (_, work, __) {
                  return ProjectBuilder(
                    project: projects, 
                    mode: mode,
                    edited: edited,
                    projects: works,  
                  );
                }
              ),
            
            ValueListenableBuilder(
              valueListenable: works,
              builder: (_, value, __) {
                return Visibility(
                  visible: value.isNotEmpty && !mode.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 220,
                          child: OButton(
                            onClick: (){},
                            text: 'Cancel'),
                        ),
                        SizedBox(
                          width: 220,
                          child: EButton(
                            onClick: (){
                              // onChanged(entries);
                            }, 
                            text: 'Save'),
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        );
      }
    );
  }
}