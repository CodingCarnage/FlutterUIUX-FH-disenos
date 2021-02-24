import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/headers_widget.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: HeaderWave(
        color: appTheme.accentColor,
      ),
    );
  }
}
