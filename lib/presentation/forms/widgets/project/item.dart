import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const ProjectItem({
    super.key, 
    required this.project,
    required this.onDelete,  
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return BSContainer(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          children: [
            Expanded(
              child: (project.name??'').bodyMedium(context, height: 1.6),
            ),
            IconButton(
              onPressed: ()=>onEdit(), 
              icon: const Icon(Icons.edit),
              splashRadius: 20,
              iconSize: 18,
            ),
            IconButton(
              onPressed: ()=>onDelete(), 
              icon: const Icon(Icons.delete),
              splashRadius: 20,
              iconSize: 18,
            )
          ],
         ),

         if(project.description!=null && project.description!.isNotEmpty)
         (project.description??'').bodySmall(context, height: 1.6),
         
         ('${project.startDate} - ${project.endDate}').bodySmall(context, height: 1.6),

         (project.technologiesUsed?.join(',')??'').bodySmall(context, height: 1.6),

        ],
      ));
  }
}