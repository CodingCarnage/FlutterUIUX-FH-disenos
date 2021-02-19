import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LargeButtonBackground();
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
      width: double.infinity,
      height: screenSize.height * 0.1,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4.0, 6.0),
            blurRadius: 10.0,
          )
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff54C5F8),
            Color(0xff01579B),
          ]
        ),
      ),
    );
  }
}
