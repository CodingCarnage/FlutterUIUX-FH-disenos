import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/widgets/headers_widget.dart';
import 'package:disenos/src/widgets/large_button_widget.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_ItemButton> items = <_ItemButton>[
      new _ItemButton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        [Color(0xff6989F5), Color(0xff906EF5)],
      ),
      new _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        [Color(0xff66A9F2), Color(0xff536CF6)],
      ),
      new _ItemButton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        [Color(0xffF2D572), Color(0xffE06AA3)],
      ),
      new _ItemButton(
        FontAwesomeIcons.biking,
        'Awards',
        [Color(0xff317183), Color(0xff46997D)],
      ),
      new _ItemButton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        [Color(0xff6989F5), Color(0xff906EF5)],
      ),
      new _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        [Color(0xff66A9F2), Color(0xff536CF6)],
      ),
      new _ItemButton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        [Color(0xffF2D572), Color(0xffE06AA3)],
      ),
      new _ItemButton(
        FontAwesomeIcons.biking,
        'Awards',
        [Color(0xff317183), Color(0xff46997D)],
      ),
      new _ItemButton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        [Color(0xff6989F5), Color(0xff906EF5)],
      ),
      new _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        [Color(0xff66A9F2), Color(0xff536CF6)],
      ),
      new _ItemButton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        [Color(0xffF2D572), Color(0xffE06AA3)],
      ),
      new _ItemButton(
        FontAwesomeIcons.biking,
        'Awards',
        [Color(0xff317183), Color(0xff46997D)],
      ),
    ];

    final List<Widget> itemMap = items
        .map((item) => LargeButton(
              icon: item.icon,
              text: item.text,
              onPressed: () => print(item.text),
              backgroundColors: item.colors,
            ))
        .toList();

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.25),
            child: ListView(
              children: <Widget>[
                SizedBox(height: screenSize.height * 0.055),
                ...itemMap,
              ],
            ),
          ),
          IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Asistencia Médica',
            subtitle: 'Haz solicitado',
          ),
        ],
      ),
    );
  }
}

class _LargeButtonTemp extends StatelessWidget {
  const _LargeButtonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeButton(
      icon: FontAwesomeIcons.facebook,
      text: 'Facebook',
      onPressed: () {
        print('Click!');
      },
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

class _ItemButton {
  _ItemButton(
    this.icon,
    this.text,
    this.colors,
  );

  final IconData icon;
  final String text;
  final List<Color> colors;
}
