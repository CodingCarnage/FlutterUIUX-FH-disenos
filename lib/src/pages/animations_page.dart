import 'package:flutter/material.dart';

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

class _RectangleAnimatedState extends State<RectangleAnimated> {
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
        color: Colors.indigo,
      ),
    );
  }
}
