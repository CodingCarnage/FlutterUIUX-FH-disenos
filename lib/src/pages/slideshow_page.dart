import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Slides(),
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
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
