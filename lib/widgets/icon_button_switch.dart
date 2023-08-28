import 'package:flutter/material.dart';

class IconButtonSwitch extends StatefulWidget {
  final IconData preIcon;
  final IconData postIcon;
  final ValueChanged onChanged;
  const IconButtonSwitch({
    super.key,
    required this.onChanged,
    required this.postIcon,
    required this.preIcon  
  });

  @override
  State<IconButtonSwitch> createState() => _IconButtonSwitchState();
}

class _IconButtonSwitchState extends State<IconButtonSwitch> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: (){
        setState(() {
          value = !value;
        });
        widget.onChanged(value);
      }, 
      icon: Icon(
        value ? widget.preIcon : widget.postIcon
      )
    );
  }
}