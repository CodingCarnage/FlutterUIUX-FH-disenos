import 'package:flutter/material.dart';

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
        child: Text(
          '$percentage%',
          style: Theme.of(context).textTheme.headline5,
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
