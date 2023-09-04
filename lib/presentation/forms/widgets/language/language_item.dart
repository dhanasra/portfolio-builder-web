import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/data_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/language.dart';
import 'package:portfolio_builder_ai/widgets/single_select.dart';

import '../../../../widgets/input_field.dart';

class LanguageItem extends StatelessWidget {
  final Language language;
  final ValueNotifier<List<Language>> languageNotifier;
  const LanguageItem({
    super.key,
    required this.language,
    required this.languageNotifier,
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController languageController = TextEditingController(text: language.name);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IgnorePointer(
                child: InputField(
                  labelText: 'Language',
                  required:  false,
                  controller: languageController,
                  defaultMargin: true,
                ),
              ),
            ),
            16.width(),
            Expanded(
              child: IgnorePointer(
                child: SingleSelect(
                  labelText: 'Fluency',
                  required:  false,
                  value: language.fluency,
                  options: DataConst.languageProficiency,
                  onChanged: (v){},
                  defaultMargin: true,
                ),
              ),
            ),
            8.width(),
            Container(
              height: 46,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: (){
                  languageNotifier.value.remove(language);
                  languageNotifier.notifyListeners();
                }, 
                splashRadius: 20,
                icon: const Icon(Icons.delete)),
            )
          ],
        ),
    );
  }
}