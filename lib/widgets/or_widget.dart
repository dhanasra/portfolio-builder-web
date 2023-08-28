import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: 'OR'.bodySmall(context),  
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}