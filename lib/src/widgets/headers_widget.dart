import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  const HeaderSquare({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.35,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderCircularBorders extends StatelessWidget {
  const HeaderCircularBorders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.35,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.0),
          bottomRight: Radius.circular(70.0),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.35,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Paint Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    final Path path = new Path();

    // Draw
    path.moveTo(0, size.height);
    path.lineTo(size.width, (size.height - 20.0));
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderTriangle extends StatelessWidget {
  const HeaderTriangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Paint Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    final Path path = new Path();

    // Draw
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPeak extends StatelessWidget {
  const HeaderPeak({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPeakPainter(),
      ),
    );
  }
}

class _HeaderPeakPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Paint Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;

    final Path path = new Path();

    // Draw
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.325);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCircular extends StatelessWidget {
  const HeaderCircular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCircularPainter(),
      ),
    );
  }
}

class _HeaderCircularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Paint Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;

    final Path path = new Path();

    // Draw
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderWave extends StatelessWidget {
  const HeaderWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Paint Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;

    final Path path = new Path();

    // Draw
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.close();
    
    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}