// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/profile_pix.png',
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Color(0xFF888888),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width -
                  20, // Adjusted width of the main container
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF888888),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5 - 20,
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Currency',
                        hintStyle: TextStyle(
                          color: Color(0xFF888888),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 20,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 2.0,
                          height: 20.0,
                          color: Color(0xFF888888), // Set your desired color
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Positioned(
                          child: TriangleContainer(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
