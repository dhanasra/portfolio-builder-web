import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

class EducationItem extends StatelessWidget {
  final Education education;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const EducationItem({
    super.key, 
    required this.education,
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
              child: (education.area??'').bodyMedium(context, height: 1.6),
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

         if(education.studyType!=null && education.studyType!.isNotEmpty)
         (education.studyType??'').bodySmall(context, height: 1.6),
         
         (education.institution??'').bodySmall(context, height: 1.6),

         if(education.score!=null && education.score!.isNotEmpty)
         (education.score??'').bodySmall(context, height: 1.6),

         '${education.startDate??''} - ${education.endDate??''}'.bodySmall(context, height: 1.6),
        
        ],
      ));
  }
}