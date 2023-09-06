import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/publications/item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class PublicationBuilder extends StatelessWidget {
  final ValueNotifier mode;
  final ValueNotifier<List<Publication>> publications;
  final ValueNotifier edited;
  const PublicationBuilder({
    super.key, 
    required this.edited,
    required this.mode,
    required this.publications
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: publications.value.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Publication'
            ),
            20.height(),
            ...publications.value.map(
              (e) => PublicationItem(
                publication: e,
                onDelete: (){
                  publications.value.removeAt(publications.value.indexOf(e));
                  publications.notifyListeners();
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
                child: 'No publication details added yet. Add publication details.'.bodySmall(
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