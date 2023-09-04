import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/data_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/widgets/single_select.dart';

import '../../../../network/models/skills.dart';
import '../../../../widgets/input_field.dart';

class SkillAdder extends StatelessWidget {
  final ValueNotifier<List<Skills>> skillNotifier;
  final String domain;
  const SkillAdder({
    super.key,
    required this.domain,
    required this.skillNotifier    
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController skillController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    String? skillLevel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Form(
        key: formKey,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputField(
                  labelText: 'Skill',
                  controller: skillController,
                  defaultMargin: true,
                ),
              ),
              16.width(),
              Expanded(
                child: SingleSelect(
                  labelText: 'Level',
                  options: DataConst.skillLevel,
                  onChanged: (v){
                    skillLevel = v;
                  },
                  defaultMargin: true,
                ),
              ),
              8.width(),
              Container(
                height: 46,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: (){
                    if(!formKey.currentState!.validate()) return;
                    
                    List<Skills> skills = skillNotifier.value.where((element) => element.domain==domain).toList();
                    var skill = Skills(
                      domain: domain,
                      name: skillController.trim(),
                      level: skillLevel  
                    );
                    if(skills.length==1 && skills.first.name==null){
                        skillNotifier.value.remove(skills.first);
                        skillNotifier.value.add(skill);
                    }else{
                        skillNotifier.value.add(skill);
                    }
                    skillNotifier.notifyListeners();
                  }, 
                  splashRadius: 20,
                  icon: const Icon(Icons.add_circle)),
              )
            ],
          ),
      ),
    );
  }
}