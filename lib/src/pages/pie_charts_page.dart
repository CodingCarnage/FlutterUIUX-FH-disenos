import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/radial_progress_widget.dart';

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
      backgroundColor: Color.fromARGB(255, 39, 40, 34),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.redAccent,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.blueAccent,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.deepOrangeAccent,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.indigoAccent,
              ),
            ],
          ),
        ],
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

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key key,
    @required this.percentage,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Center(
        child: RadialProgress(
          percentage: percentage,
          color: color,
          backgroundColor: Colors.white,
          fill: true,
          lineWidth: 15.0,
          backgroundLineWidth: 15.0,
          showTextPercentage: true,
          textPercentageColor: Colors.black,
          textPercentageOutlineColor: Colors.white,
          changeToGradient: true,
          strokeCap: StrokeCap.round,
          gradientColors: [
            Colors.deepPurple[200],
            Colors.deepPurpleAccent[700]
          ],
        ),
      ),
    );
  }
}
