import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/education/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/education/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class EducationForm extends StatelessWidget {
  final List<Education> education;
  final ValueChanged<List<Education>> onChanged;
  const EducationForm({
    super.key, 
    required this.education,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Education>> works = ValueNotifier(education);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Education?> edited = ValueNotifier(null);

    final TextEditingController institutionController = TextEditingController();
    final TextEditingController areaController = TextEditingController();
    final TextEditingController studyTypeController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController scoreController = TextEditingController();



    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, isEdit, __) {
        return Column(
          children: [

            if(isEdit)
              ValueListenableBuilder(
                valueListenable: edited,
                builder: (_, val, __) {
                  return EducationFields(
                    works: works, 
                    mode: mode,
                    education: edited.value,
                    areaController: areaController, 
                    studyTypeController: studyTypeController, 
                    institutionController: institutionController, 
                    endDateController: endDateController, 
                    scoreController: scoreController, 
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
                  return EducationBuilder(
                    education: education, 
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