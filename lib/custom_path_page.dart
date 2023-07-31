import 'package:flutter/material.dart';

class CustomPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Path'),
      ),
      body: Center(
        child: CustomPaint(
          painter: PathPainter(),
          size: Size(300, 300), // Set the size of the canvas
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Create a list of points to form a path
    List<Offset> points = [
      Offset(50, 50),
      Offset(100, 150),
      Offset(150, 100),
      Offset(200, 200),
    ];

    // Create a path and move it to the first point in the list
    Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    // Add the remaining points as line segments to the path
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}