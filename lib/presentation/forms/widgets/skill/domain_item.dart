import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/skills.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/skill/skill_adder.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/skill/skill_item.dart';

import '../../../../widgets/b_container.dart';

class DomainItem extends StatelessWidget {
  final String domain;
  final List<Skills> skills;
  final ValueNotifier<List<Skills>> skillsNotifier;
  const DomainItem({
    super.key,
    required this.domain,  
    required this.skills,
    required this.skillsNotifier
  });

  @override
  Widget build(BuildContext context) {
    return BContainer(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          domain.bodyMedium(context),
          32.height(),

          if(!(skills.length==1&&skills.first.name==null))
          ...skills.map(
            (skill) => SkillItem(
              skill: skill, 
              onDelete: (){
                  if(skills.length==1){
                    skillsNotifier.value.remove(skills.first);
                    skillsNotifier.value.add(Skills(domain: skill.domain));
                  }else{
                    skillsNotifier.value.remove(skill);
                  }
                  skillsNotifier.notifyListeners();
              })
          ).toList(),

          SkillAdder(
            domain: domain, 
            skillNotifier: skillsNotifier
          )
        ],
      ));
  }
}