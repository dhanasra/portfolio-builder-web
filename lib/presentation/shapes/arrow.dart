import 'package:flutter/material.dart';

class Arrow extends CustomPainter {
  Color color;
  bool reverse;

  Arrow(this.color, {this.reverse = false});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    
    if(!reverse){
      path = path
      ..moveTo(size.width, 0)         
      ..lineTo(0, size.height / 2)     
      ..lineTo(size.width, size.height) 
      ..close();
    }else{
      path = path
      ..moveTo(0, 0)                    
      ..lineTo(size.width, size.height / 2) 
      ..lineTo(0, size.height)          
      ..close();
    }

    // canvas.drawShadow(path, Colors.black, 10.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}