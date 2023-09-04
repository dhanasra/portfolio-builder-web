import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/skills.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/skill/domain_adder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/skill/domain_item.dart';
import 'package:portfolio_builder_ai/utils/utils.dart';

import '../../widgets/e_button.dart';
import '../../widgets/o_button.dart';

class SkillsForm extends StatelessWidget {
  final List<Skills> skills;
  final ValueChanged<List<Skills>> onChanged;
  const SkillsForm({
    super.key,
    required this.skills,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<List<Skills>> skillsNotifier = ValueNotifier(skills);

    

    return Column(
      children: [

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: skillsNotifier,
              builder: (_, val, __) {

                var skillGroup = groupByProperty(skillsNotifier.value, (skill) => skill.domain);

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    
                    DomainAdder(skillNotifier: skillsNotifier),

                    if(skillGroup.keys.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: 'Added Domains'.bodySmall(context),  
                    ),

                    ...skillGroup.keys.map(
                      (e) => DomainItem(
                        domain: e!, 
                        skills: skillGroup[e]??[],
                        skillsNotifier: skillsNotifier
                      )
                    ).toList()
                    
                  ],
                );
              }
            )
          ),


          ValueListenableBuilder(
            valueListenable: skillsNotifier,
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