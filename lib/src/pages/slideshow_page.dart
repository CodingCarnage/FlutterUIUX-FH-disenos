import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/slideshow_widget.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(),
    );
  }
}
