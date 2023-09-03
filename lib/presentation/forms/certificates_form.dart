import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/certificates/builder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/certificates/fields.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

import '../../widgets/o_button.dart';

class CertificatesForm extends StatelessWidget {
  final List<Certificate> certificate;
  final ValueChanged<List<Certificate>> onChanged;
  const CertificatesForm({
    super.key, 
    required this.certificate,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final ValueNotifier<List<Certificate>> works = ValueNotifier(certificate);

    final ValueNotifier<bool> mode = ValueNotifier(false);
    final ValueNotifier<Certificate?> edited = ValueNotifier(null);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController issuerController = TextEditingController();
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
                  return CertificateFields(
                    certificates: works, 
                    mode: mode,
                    certificate: edited.value,
                    nameController: nameController, 
                    dateController: dateController, 
                    issuerController: issuerController, 
                    urlController: urlController, 
                    autovalidateMode: autovalidateMode, 
                    formKey: formKey
                  );
                }
              )
            else
              ValueListenableBuilder(
                valueListenable: works,
                builder: (_, work, __) {
                  return CertificatesBuilder(
                    certificate: certificate, 
                    mode: mode,
                    edited: edited,
                    certificates: works,  
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