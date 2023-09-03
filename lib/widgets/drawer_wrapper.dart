import 'package:flutter/material.dart';

class DrawerWrapper extends StatelessWidget {
  final Widget child;
  const DrawerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Drawer(
            width: 520,
            child: child
          )
        ],
      )
    );
  }
}