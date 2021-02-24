import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos/src/pages/launcher_page.dart';

import 'package:disenos/src/theme/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
