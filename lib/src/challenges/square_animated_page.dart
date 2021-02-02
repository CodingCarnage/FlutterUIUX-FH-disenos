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

class __SquareAnimatedState extends State<_SquareAnimated> {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Rectangle();
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
