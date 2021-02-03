import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          // color: Colors.deepPurpleAccent,
          child: CustomPaint(
            painter: _RadialProgressPainter(percentage: 50.0),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({
    this.percentage,
  });

  final percentage;

  @override
  void paint(Canvas canvas, Size size) {
    //* Complete circle.
    final Paint paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final Offset center = new Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //* Arch
    final Paint paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;

    //* Parts to fill.
    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
