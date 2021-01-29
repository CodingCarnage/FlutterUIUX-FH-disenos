import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  const HeaderSquare({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.35,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderCircularBorders extends StatelessWidget {
  const HeaderCircularBorders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.35,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
    );
  }
}
