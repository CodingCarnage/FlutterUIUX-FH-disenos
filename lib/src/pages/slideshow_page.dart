import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: _Slides()),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  const _Slides({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: <Widget>[
          _Slide(svg: 'assets/svgs/Slide-1.svg'),
          _Slide(svg: 'assets/svgs/Slide-4.svg'),
          _Slide(svg: 'assets/svgs/Slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key key,
    @required this.svg,
  }) : super(key: key);

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(screenSize: screenSize),
          _Dot(screenSize: screenSize),
          _Dot(screenSize: screenSize),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.015,
      width: screenSize.height * 0.015,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );
  }
}
