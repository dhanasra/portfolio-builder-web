import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/publications/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/publications/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class PublicationForm extends StatelessWidget {
  final List<Publication> publication;
  final ValueChanged<List<Publication>> onChanged;
  const PublicationForm({
    super.key, 
    required this.publication,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Publication>> works = ValueNotifier(publication);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Publication?> edited = ValueNotifier(null);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController publisherController = TextEditingController();
    final TextEditingController urlController = TextEditingController();
    final TextEditingController releaseDateController = TextEditingController();
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
                  return PublicationFields(
                    publications: works, 
                    mode: mode,
                    publication: edited.value,
                    nameController: nameController, 
                    urlController: urlController, 
                    summaryController: summaryController, 
                    releaseDateController: releaseDateController, 
                    publisherController: publisherController, 
                    autovalidateMode: autovalidateMode, 
                    formKey: formKey
                  );
                }
              )
            else
              ValueListenableBuilder(
                valueListenable: works,
                builder: (_, work, __) {
                  return PublicationBuilder(
                    mode: mode,
                    edited: edited,
                    publications: works,  
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