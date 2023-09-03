import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

class WorkItem extends StatelessWidget {
  final WorkExperience experience;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const WorkItem({
    super.key, 
    required this.experience,
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
              child: (experience.jobTitle??'').bodyMedium(context, height: 1.6),
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
         
         (experience.employer??'').bodySmall(context, height: 1.6),

         '${experience.startDate??''} - ${experience.endDate??''}'.bodySmall(context, height: 1.6),

         if(experience.achievements?.join(',')!=null && experience.achievements!.join(',').isNotEmpty)
         (experience.achievements?.join(',')??'').bodySmall(context, height: 1.6),
         
         if(experience.description!=null && experience.description!.isNotEmpty)
         (experience.description??'').bodySmall(context, height: 1.6)
        ],
      ));
  }
}