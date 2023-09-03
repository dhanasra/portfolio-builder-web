import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const PublicationItem({
    super.key, 
    required this.publication,
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
              child: (publication.name??'').bodyMedium(context, height: 1.6),
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

         if(publication.publisher!=null && publication.publisher!.isNotEmpty)
         (publication.publisher??'').bodySmall(context, height: 1.6),
         
         ('${publication.releaseDate}').bodySmall(context, height: 1.6),

         ('${publication.url}').bodySmall(context, height: 1.6),

         ('${publication.summary}').bodySmall(context, height: 1.6),

        ],
      ));
  }
}