import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/work/work_item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class WorkBuilder extends StatelessWidget {
  final List<WorkExperience> experience;
  final ValueNotifier mode;
  final ValueNotifier works;
  final ValueNotifier edited;
  const WorkBuilder({
    super.key, 
    required this.experience,
    required this.edited,
    required this.mode,
    required this.works
  });

  @override
  Widget build(BuildContext context) {

    // experience.add(
    //   const WorkExperience(
    //     jobTitle: 'Flutter Developer',
    //     employer: 'Instrive Soft Labs',
    //     startDate: '22 Jan, 2018',
    //     endDate: '16 Dec, 2016',
    //     description: 'Worked as Senior architect in Turbo Talent, Job portal application',
    //     achievements: [
    //       'Best employee award'
    //     ]
    //   )
    // );

    return Expanded(
      child: experience.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Experience'
            ),
            20.height(),
            ...experience.map(
              (e) => WorkItem(
                experience: e,
                onDelete: (){
                  works.value.removeAt(works.value.indexOf(e));
                  works.notifyListeners();
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
                child: 'No work experiences added yet. Add work experience.'.bodySmall(
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