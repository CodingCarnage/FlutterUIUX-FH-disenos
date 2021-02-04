import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/radial_progress.dart';

class PieChartsPage extends StatefulWidget {
  const PieChartsPage({Key key}) : super(key: key);

  @override
  _PieChartsPageState createState() => _PieChartsPageState();
}

class _PieChartsPageState extends State<PieChartsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          child: Center(
            child: RadialProgress(
              percentage: percentage,
              color: Colors.redAccent,
              lineWidth: 40.0,
              backgroundLineWidth: 40.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
    );
  }
}
