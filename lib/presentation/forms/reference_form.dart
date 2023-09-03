import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/reference.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/reference/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/reference/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class ReferenceForm extends StatelessWidget {
  final List<Reference> reference;
  final ValueChanged<List<Reference>> onChanged;
  const ReferenceForm({
    super.key, 
    required this.reference,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Reference>> works = ValueNotifier(reference);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Reference?> edited = ValueNotifier(null);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController positionController = TextEditingController();
    final TextEditingController organizationController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, isEdit, __) {
        return Column(
          children: [

            if(isEdit)
              ValueListenableBuilder(
                valueListenable: edited,
                builder: (_, val, __) {
                  return ReferenceFields(
                    references: works, 
                    mode: mode,
                    reference: edited.value,
                    nameController: nameController, 
                    positionController: positionController, 
                    organizationController: organizationController, 
                    emailController: emailController, 
                    phoneController: phoneController,  
                    autovalidateMode: autovalidateMode, 
                    formKey: formKey
                  );
                }
              )
            else
              ValueListenableBuilder(
                valueListenable: works,
                builder: (_, work, __) {
                  return ReferenceBuilder(
                    reference: reference, 
                    mode: mode,
                    edited: edited,
                    references: works,  
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