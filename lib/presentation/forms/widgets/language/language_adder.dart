import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/data_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/language.dart';
import 'package:portfolio_builder_ai/widgets/single_select.dart';

import '../../../../widgets/input_field.dart';

class LanguageAdder extends StatelessWidget {
  final ValueNotifier<List<Language>> languageNotifier;
  const LanguageAdder({
    super.key,
    required this.languageNotifier    
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController languageController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    String? fluency;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Form(
        key: formKey,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputField(
                  labelText: 'Language',
                  controller: languageController,
                  defaultMargin: true,
                ),
              ),
              16.width(),
              Expanded(
                child: SingleSelect(
                  labelText: 'Fluency',
                  options: DataConst.languageProficiency,
                  onChanged: (v){
                    fluency = v;
                  },
                  defaultMargin: true,
                ),
              ),
              8.width(),
              Container(
                height: 46,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: (){
                    if(!formKey.currentState!.validate()) return;
                    
                    Language language = Language(
                      name: languageController.trim(), 
                      fluency: fluency??''
                    );

                    languageNotifier.value = [...languageNotifier.value, language];
                    languageNotifier.notifyListeners();
                  }, 
                  splashRadius: 20,
                  icon: const Icon(Icons.add_circle)),
              )
            ],
          ),
      ),
    );
  }
}