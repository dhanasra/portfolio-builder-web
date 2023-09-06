import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/certificates/item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class CertificatesBuilder extends StatelessWidget {
  final ValueNotifier mode;
  final ValueNotifier<List<Certificate>> certificates;
  final ValueNotifier edited;
  const CertificatesBuilder({
    super.key, 
    required this.edited,
    required this.mode,
    required this.certificates
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: certificates.value.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Certificate'
            ),
            20.height(),
            ...certificates.value.map(
              (e) => CertificateItem(
                certificate: e,
                onDelete: (){
                  certificates.value.removeAt(certificates.value.indexOf(e));
                  certificates.notifyListeners();
                },
                onEdit: (){
                  edited.value = e;
                  mode.value = true;
                },  
              )
            ).toList()
          ],
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Icon(FontAwesomeIcons.boxOpen, size: 44,),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: 'No certificate details added yet. Add certificate details.'.bodySmall(
                  context, height: 1.6, isCenter: true),
              ),
              SizedBox(
                width: 200,
                child: OButton(
                  onClick: ()=>mode.value = true, 
                  text: 'Add New'),
              )
          ],
        ),
    );
  }
}