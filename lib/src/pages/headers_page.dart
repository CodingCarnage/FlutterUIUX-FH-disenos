import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/headers_widget.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWave(),
    );
  }
}
