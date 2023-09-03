import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/award.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/awards/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/awards/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class AwardsForm extends StatelessWidget {
  final List<Award> award;
  final ValueChanged<List<Award>> onChanged;
  const AwardsForm({
    super.key, 
    required this.award,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Award>> works = ValueNotifier(award);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Award?> edited = ValueNotifier(null);

    final TextEditingController titleController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController awarderController = TextEditingController();
    final TextEditingController summaryController = TextEditingController();


    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, isEdit, __) {
        return Column(
          children: [

            if(isEdit)
              ValueListenableBuilder(
                valueListenable: edited,
                builder: (_, val, __) {
                  return AwardFields(
                    awards: works, 
                    mode: mode,
                    award: edited.value,
                    titleController: titleController, 
                    dateController: dateController, 
                    awarderController: awarderController, 
                    summaryController: summaryController, 
                    autovalidateMode: autovalidateMode, 
                    formKey: formKey
                  );
                }
              )
            else
              ValueListenableBuilder(
                valueListenable: works,
                builder: (_, work, __) {
                  return AwardsBuilder(
                    award: award, 
                    mode: mode,
                    edited: edited,
                    awards: works,  
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