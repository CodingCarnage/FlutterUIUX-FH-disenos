import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos/src/models/layout_model.dart';

import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/pages/launcher_tablet_page.dart';

import 'package:disenos/src/theme/theme.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(1)),
          ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel())
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // return Container(
          //   child: LauncherPage(),
          // );
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
