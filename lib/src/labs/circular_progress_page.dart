import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animationController.addListener(() { 
      // print('AnimationController: ${animationController.value}');
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, animationController.value);
      });
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: _RadialProgressPainter(percentage: percentage),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage = newPercentage;
            newPercentage += 10;
            if (newPercentage > 100) {
              newPercentage = 0;
              percentage = 0;
            }
            animationController.forward(from: 0.0);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
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
    final double radius = Math.min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //* Arch
    final Paint paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;

    //* Parts to fill.
    double arcAngle = 2 * Math.pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -Math.pi / 2,
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
