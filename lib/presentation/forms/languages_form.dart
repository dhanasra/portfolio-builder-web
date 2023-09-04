import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/language.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/language/language_adder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/language/language_item.dart';

import '../../widgets/e_button.dart';
import '../../widgets/o_button.dart';

class LanguagesForm extends StatelessWidget {
  final List<Language> languages;
  final ValueChanged<List<Language>> onChanged;
  const LanguagesForm({
    super.key,
    required this.languages,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<List<Language>> languageNotifier = ValueNotifier(languages);

    return Column(
      children: [

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: languageNotifier,
              builder: (_, val, __) {
                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    ...languages.map(
                      (language) => LanguageItem(
                        language: language, 
                        languageNotifier: languageNotifier)
                    ).toList(),
                    LanguageAdder(
                      languageNotifier: languageNotifier
                    ),
                  ],
                );
              }
            )),

          ValueListenableBuilder(
            valueListenable: languageNotifier,
            builder: (_, value, __) {
              return Visibility(
                visible: value.isNotEmpty,
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
}