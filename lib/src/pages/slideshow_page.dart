import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:disenos/src/widgets/slideshow_widget.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _SlideshowWidget()),
          Expanded(child: _SlideshowWidget()),
        ],
      ),
    );
  }
}

class _SlideshowWidget extends StatelessWidget {
  const _SlideshowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      dotsOnTop: false,
      primaryColor: Colors.orange,
      secondaryColor: Colors.grey,
      primaryBulletSize: 20,
      secondaryBulletSize: 10,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/Slide-1.svg'),
        SvgPicture.asset('assets/svgs/Slide-5.svg'),
        SvgPicture.asset('assets/svgs/Slide-3.svg'),
        SvgPicture.asset('assets/svgs/Slide-4.svg'),
      ],
    );
  }
}
