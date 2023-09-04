import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

import '../../../../network/models/award.dart';

class AwardItem extends StatelessWidget {
  final Award award;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const AwardItem({
    super.key, 
    required this.award,
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
              child: (award.title??'').bodyMedium(context, height: 1.6),
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

         if(award.awarder!=null && award.awarder!.isNotEmpty)
         (award.awarder??'').bodySmall(context, height: 1.6),
         
         ('${award.date}').bodySmall(context, height: 1.6),

         (award.summary??'').bodySmall(context, height: 1.6),

        ],
      ));
  }
}