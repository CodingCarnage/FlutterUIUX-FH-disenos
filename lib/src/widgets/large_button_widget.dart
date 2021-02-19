import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _LargeButtonBackground(),
        _LargeButtonForeground(),
      ],
    );
  }
}

class _LargeButtonForeground extends StatelessWidget {
  const _LargeButtonForeground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.1,
      margin: const EdgeInsets.all(20.0),
      child: Center(
        child: ListTile(
          leading: FaIcon(
            FontAwesomeIcons.carCrash,
            color: Colors.white,
            size: screenSize.width * 0.1,
          ),
          title: Text(
            'Car accident',
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
          ),
          trailing: FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _LargeButtonBackground extends StatelessWidget {
  const _LargeButtonBackground({
    Key key,
  }) : super(key: key);

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
                FontAwesomeIcons.carCrash,
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
          colors: <Color>[
            Color(0xff54C5F8),
            Color(0xff01579B),
          ],
        ),
      ),
    );
  }
}
