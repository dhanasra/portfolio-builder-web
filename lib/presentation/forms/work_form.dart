import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/work/work_builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/work/work_fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class WorkForm extends StatelessWidget {
  final List<WorkExperience> experience;
  final ValueChanged<List<WorkExperience>> onChanged;
  const WorkForm({
    super.key, 
    required this.experience,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<WorkExperience>> works = ValueNotifier(experience);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<WorkExperience?> edited = ValueNotifier(null);

    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController employerController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController achievementsController = TextEditingController();


    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, isEdit, __) {
        return Column(
          children: [

            if(isEdit)
              ValueListenableBuilder(
                valueListenable: edited,
                builder: (_, val, __) {
                  return WorkFields(
                    works: works, 
                    mode: mode,
                    experience: edited.value,
                    achievementsController: achievementsController, 
                    descriptionController: descriptionController, 
                    employerController: employerController, 
                    endDateController: endDateController, 
                    jobTitleController: jobTitleController, 
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
                  return WorkBuilder(
                    experience: work, 
                    mode: mode,
                    edited: edited,
                    works: works,  
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
                              onChanged(works.value);
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