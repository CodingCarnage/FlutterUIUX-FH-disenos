import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  RadialProgress({
    Key key,
    @required this.percentage,
    this.color = Colors.blueAccent,
    this.backgroundColor = Colors.grey,
    this.lineWidth = 10.0,
    this.backgroundLineWidth = 4.0,
  }) : super(key: key);

  final double percentage;
  final Color color;
  final Color backgroundColor;
  final double lineWidth;
  final double backgroundLineWidth;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double oldPercentage;

  @override
  void initState() {
    super.initState();

    oldPercentage = widget.percentage;
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);

    final double percentageDifference = widget.percentage - oldPercentage;
    oldPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              percentage: (widget.percentage - percentageDifference) +
                  (percentageDifference * animationController.value),
              color: widget.color,
              backgroundColor: widget.backgroundColor,
              lineWidth: widget.lineWidth,
              backgroundLineWidth: widget.backgroundLineWidth,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({
    @required this.percentage,
    @required this.color,
    @required this.backgroundColor,
    @required this.lineWidth,
    @required this.backgroundLineWidth,
  });

  final double percentage;
  final Color color;
  final Color backgroundColor;
  final double lineWidth;
  final double backgroundLineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    //* Complete circle.
    final Paint paint = new Paint()
      ..strokeWidth = backgroundLineWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;
    final Offset center = new Offset(size.width / 2.0, size.height / 2.0);
    final double radius = Math.min(size.width / 2.0, size.height / 2.0);

    canvas.drawCircle(center, radius, paint);

    //* Arch
    final Paint paintArc = new Paint()
      ..strokeWidth = lineWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    //* Parts to fill.
    double arcAngle = 2.0 * Math.pi * (percentage / 100.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -Math.pi / 2.0,
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
