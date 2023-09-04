import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/skills.dart';

import '../../../../widgets/e_button.dart';
import '../../../../widgets/input_field.dart';

class DomainAdder extends StatelessWidget {
  final ValueNotifier<List<Skills>> skillNotifier;
  const DomainAdder({
    super.key,
    required this.skillNotifier  
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController domainController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();

    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: InputField(
              labelText: 'Domain Name',
              controller: domainController,
              defaultMargin: true,
            ),
          ),
          16.width(),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 46,
              child: EButton(
                onClick: (){
                  if(!formKey.currentState!.validate()) return;
                  skillNotifier.value.add(
                    Skills(
                      domain: domainController.text
                    )
                  );
                  domainController.clear();
                  skillNotifier.notifyListeners();

                }, 
                text: 'Add Domain'
              ),
            )
          )
        ],
      ),
    );
  }
}