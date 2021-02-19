import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LargeButton extends StatelessWidget {
  static const List<Color> defaultBackgroundColors = <Color>[
    Color(0xff54C5F8),
    Color(0xff01579B),
  ];

  const LargeButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.backgroundColors = defaultBackgroundColors,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final List<Color> backgroundColors;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _LargeButtonBackground(
          icon: this.icon,
          backgroundColors: this.backgroundColors,
        ),
        _LargeButtonForeground(
          icon: this.icon,
          text: this.text,
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}

class _LargeButtonForeground extends StatelessWidget {
  const _LargeButtonForeground({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.1,
      margin: const EdgeInsets.all(20.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: this.onPressed,
          child: Center(
            child: ListTile(
              leading: FaIcon(
                this.icon,
                color: Colors.white,
                size: screenSize.width * 0.1,
              ),
              title: Text(
                this.text,
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LargeButtonBackground extends StatelessWidget {
  const _LargeButtonBackground({
    Key key,
    @required this.icon,
    @required this.backgroundColors,
  }) : super(key: key);

  final IconData icon;
  final List<Color> backgroundColors;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20.5,
              top: -20.5,
              child: FaIcon(
                this.icon,
                size: screenSize.width * 0.325,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: screenSize.height * 0.1,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4.0, 6.0),
            blurRadius: 10.0,
          )
        ],
        gradient: LinearGradient(
          colors: this.backgroundColors,
        ),
      ),
    );
  }
}
