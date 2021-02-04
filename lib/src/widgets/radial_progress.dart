import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  RadialProgress({
    Key key,
    @required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${ widget.percentage }', style: Theme.of(context).textTheme.headline3,),
    );
  }
}
