import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';

class CertificateItem extends StatelessWidget {
  final Certificate certificate;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const CertificateItem({
    super.key, 
    required this.certificate,
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
              child: (certificate.name??'').bodyMedium(context, height: 1.6),
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

         if(certificate.issuer!=null && certificate.issuer!.isNotEmpty)
         (certificate.issuer??'').bodySmall(context, height: 1.6),
         
         ('${certificate.date}').bodySmall(context, height: 1.6),

         (certificate.url??'').bodySmall(context, height: 1.6),

        ],
      ));
  }
}