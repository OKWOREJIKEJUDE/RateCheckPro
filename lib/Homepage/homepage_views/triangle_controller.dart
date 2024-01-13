// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//todo Triangle
class TriangleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0, // Adjust the width as needed
      height: 15.0, // Adjust the height as needed
      child: CustomPaint(
        painter: HollowUpsideDownTrianglePainter(),
      ),
    );
  }
}

class HollowUpsideDownTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xFF888888)
      ..style = PaintingStyle.stroke // Use stroke to make the triangle hollow
      ..strokeWidth = 2.0; // Adjust the stroke width as needed

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
