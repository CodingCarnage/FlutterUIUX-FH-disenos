import 'package:flutter/material.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _SquareAnimated(),
      ),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({Key key}) : super(key: key);

  @override
  __SquareAnimatedState createState() => __SquareAnimatedState();
}

class __SquareAnimatedState extends State<_SquareAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> movementRight;
  Animation<double> movementLeft;
  Animation<double> movementUp;
  Animation<double> movementDown;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    movementRight = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.25,
        curve: Curves.bounceOut,
      ),
    ));

    movementUp = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.25,
        0.50,
        curve: Curves.bounceOut,
      ),
    ));

    movementLeft = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.50,
        0.75,
        curve: Curves.bounceOut,
      ),
    ));

    movementDown = Tween(
      begin: -100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.75,
        1.0,
        curve: Curves.bounceOut,
      ),
    ));

    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(
              movementRight.value == 100.0
                  ? movementLeft.value
                  : movementRight.value,
              movementUp.value == -100.0
                  ? movementDown.value
                  : movementUp.value
          ),
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
        color: Colors.redAccent,
      ),
    );
  }
}
