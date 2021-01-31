import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RectangleAnimated(),
      ),
    );
  }
}

class RectangleAnimated extends StatefulWidget {
  const RectangleAnimated({Key key}) : super(key: key);

  @override
  _RectangleAnimatedState createState() => _RectangleAnimatedState();
}

class _RectangleAnimatedState extends State<RectangleAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotation;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rotation = Tween(
      begin: 0.0,
      end: 2.0 * Math.pi,
    ).animate(animationController);

    animationController.addListener(() { 
      print('Stauts: ${animationController.status}');
      if (animationController.isCompleted) {
        animationController.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //* Play animation.
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(), //* Optional.
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: rotation.value,
          child: child,
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
    );
  }
}
