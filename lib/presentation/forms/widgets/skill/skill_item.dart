import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/data_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/widgets/single_select.dart';

import '../../../../network/models/skills.dart';
import '../../../../widgets/input_field.dart';

class SkillItem extends StatelessWidget {
  final Skills skill;
  final VoidCallback onDelete;
  const SkillItem({
    super.key,
    required this.skill,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController skillController = TextEditingController(text: skill.name);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IgnorePointer(
                child: InputField(
                  labelText: 'Skill',
                  required:  false,
                  controller: skillController,
                  defaultMargin: true,
                ),
              ),
            ),
            16.width(),
            Expanded(
              child: IgnorePointer(
                child: SingleSelect(
                  labelText: 'Level',
                  required:  false,
                  value: skill.level,
                  options: DataConst.skillLevel,
                  onChanged: (v){},
                  defaultMargin: true,
                ),
              ),
            ),
            8.width(),
            Container(
              height: 46,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: ()=>onDelete(), 
                splashRadius: 20,
                icon: const Icon(Icons.delete)),
            )
          ],
        ),
    );
  }
}