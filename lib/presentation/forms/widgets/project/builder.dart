import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/presentation/forms/widgets/project/item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';


class ProjectBuilder extends StatelessWidget {
  final List<Project> project;
  final ValueNotifier mode;
  final ValueNotifier projects;
  final ValueNotifier edited;
  const ProjectBuilder({
    super.key, 
    required this.project,
    required this.edited,
    required this.mode,
    required this.projects
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: project.isNotEmpty
        ? ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EButton(
              onClick: ()=>mode.value = true, 
              text: 'Add New Project'
            ),
            20.height(),
            ...project.map(
              (e) => ProjectItem(
                project: e,
                onDelete: (){
                  projects.value.removeAt(projects.value.indexOf(e));
                  projects.notifyListeners();
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
                child: 'No project details added yet. Add project details.'.bodySmall(
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