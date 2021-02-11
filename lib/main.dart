import 'package:flutter/material.dart';

// import 'package:disenos/src/pages/headers_page.dart';
// import 'package:disenos/src/pages/animations_page.dart';
// import 'package:disenos/src/challenges/square_animated_page.dart';
// import 'package:disenos/src/labs/circular_progress_page.dart';
// import 'package:disenos/src/pages/pie_charts_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideShowPage(),
    );
  }
}