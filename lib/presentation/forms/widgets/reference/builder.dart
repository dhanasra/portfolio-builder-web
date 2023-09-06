import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/reference.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/reference/item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class ReferenceBuilder extends StatelessWidget {
  final ValueNotifier mode;
  final ValueNotifier<List<Reference>> references;
  final ValueNotifier edited;
  const ReferenceBuilder({
    super.key, 
    required this.edited,
    required this.mode,
    required this.references
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: references.value.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Reference'
            ),
            20.height(),
            ...references.value.map(
              (e) => ReferenceItem(
                reference: e,
                onDelete: (){
                  references.value.removeAt(references.value.indexOf(e));
                  references.notifyListeners();
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
                child: 'No reference details added yet. Add reference details.'.bodySmall(
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