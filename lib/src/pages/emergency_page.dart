import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/widgets/headers_widget.dart';
import 'package:disenos/src/widgets/large_button_widget.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LargeButton(),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.pizzaSlice,
      title: 'Pizza Klein',
      subtitle: 'Blvd. Francisco I Madero, Guadalupe',
      backgroundColors: <Color>[
        Color(0xffC93231),
        Color(0xff8F3D7D),
      ],
    );
  }
}
