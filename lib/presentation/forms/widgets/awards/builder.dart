import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/award.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/awards/item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class AwardsBuilder extends StatelessWidget {
  final List<Award> award;
  final ValueNotifier mode;
  final ValueNotifier<List<Award>> awards;
  final ValueNotifier edited;
  const AwardsBuilder({
    super.key, 
    required this.award,
    required this.edited,
    required this.mode,
    required this.awards
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: awards.value.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Award'
            ),
            20.height(),
            ...awards.value.map(
              (e) => AwardItem(
                award: e,
                onDelete: (){
                  awards.value.removeAt(awards.value.indexOf(e));
                  awards.notifyListeners();
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
                child: 'No award details added yet. Add award details.'.bodySmall(
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