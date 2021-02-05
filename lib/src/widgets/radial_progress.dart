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
    this.fill = false,
    this.showTextPercentage = false,
    this.textPercentageColor = Colors.black,
    this.textPercentageOutlineColor = Colors.transparent,
  }) : super(key: key);

  final double percentage;
  final Color color;
  final Color backgroundColor;
  final double lineWidth;
  final double backgroundLineWidth;
  final bool fill;
  final bool showTextPercentage;
  final Color textPercentageColor;
  final Color textPercentageOutlineColor;

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

    if (widget.showTextPercentage == true) {
      return Stack(
        children: <Widget>[
          AnimatedBuilder(
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
                    fill: widget.fill,
                  ),
                ),
              );
            },
          ),
          _PercentageText(
            percentage: widget.percentage,
            color: widget.color,
            backgroundColor: widget.backgroundColor,
            fill: widget.fill,
            textPercentageColor: widget.textPercentageColor,
            textPercentageOutlineColor: widget.textPercentageOutlineColor,
          ),
        ],
      );
    } else {
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
                fill: widget.fill,
              ),
            ),
          );
        },
      );
    }
  }
}

class _PercentageText extends StatelessWidget {
  const _PercentageText({
    Key key,
    @required this.percentage,
    @required this.color,
    @required this.backgroundColor,
    @required this.fill,
    @required this.textPercentageColor,
    @required this.textPercentageOutlineColor,
  }) : super(key: key);

  final double percentage;
  final Color color;
  final Color backgroundColor;
  final bool fill;
  final Color textPercentageColor;
  final Color textPercentageOutlineColor;

  @override
  Widget build(BuildContext context) {
    if (fill == true) {
      return Container(
        child: Center(
          child: Stack(
            children: [
              Text(
                percentage
                        .toString()
                        .substring(0, percentage.toString().indexOf(".")) +
                    '%',
                style: Theme.of(context).textTheme.headline6.copyWith(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = textPercentageOutlineColor),
              ),
              Text(
                percentage
                        .toString()
                        .substring(0, percentage.toString().indexOf(".")) +
                    '%',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: textPercentageColor),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text(
            percentage
                    .toString()
                    .substring(0, percentage.toString().indexOf(".")) +
                '%',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: textPercentageColor),
          ),
        ),
      );
    }
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({
    @required this.percentage,
    @required this.color,
    @required this.backgroundColor,
    @required this.lineWidth,
    @required this.backgroundLineWidth,
    @required this.fill,
  });

  final double percentage;
  final Color color;
  final Color backgroundColor;
  final double lineWidth;
  final double backgroundLineWidth;
  final bool fill;

  @override
  void paint(Canvas canvas, Size size) {
    //* Complete circle.
    final Paint paint = new Paint()
      ..strokeWidth = backgroundLineWidth
      ..color = backgroundColor
      ..style = fill == true ? PaintingStyle.fill : PaintingStyle.stroke;
    final Offset center = new Offset(size.width / 2.0, size.height / 2.0);
    final double radius = Math.min(size.width / 2.0, size.height / 2.0);

    canvas.drawCircle(center, radius, paint);

    //* Arch
    final Paint paintArc = new Paint()
      ..strokeWidth = lineWidth
      ..color = color
      ..style = fill == true ? PaintingStyle.fill : PaintingStyle.stroke;

    //* Parts to fill.
    double arcAngle = 2.0 * Math.pi * (percentage / 100.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -Math.pi / 2,
      arcAngle,
      fill == true ? true : false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
