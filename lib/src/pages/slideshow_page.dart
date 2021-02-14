import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:disenos/src/widgets/slideshow_widget.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        dotsOnTop: false,
        primaryColor: Colors.orange,
        secondaryColor: Colors.grey,
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/Slide-1.svg'),
          SvgPicture.asset('assets/svgs/Slide-5.svg'),
          SvgPicture.asset('assets/svgs/Slide-3.svg'),
          SvgPicture.asset('assets/svgs/Slide-4.svg'),
        ],
      ),
    );
  }
}
