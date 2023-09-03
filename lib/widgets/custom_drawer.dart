import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';

import 'drawer_wrapper.dart';

class CustomDrawer extends StatelessWidget {
  final String header;
  final VoidCallback onClose;
  final Widget child;
  const CustomDrawer({
    super.key,
    required this.header,  
    required this.onClose,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return DrawerWrapper(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 4, 4, 0),
            title: header.bodyLarge(context),
            trailing: IconButton(
              splashRadius: 20,
              onPressed: ()=>onClose(), 
              icon: const Icon(Icons.close)),
          ),
          const Divider(),
          Expanded(
            child: child)
        ],
      ));
  }
}