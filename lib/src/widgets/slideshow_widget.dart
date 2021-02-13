import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    Key key,
    @required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: _Slides(slides: this.slides)),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    Key key,
    @required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      //Update the provider, sliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageController.page;
    });
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key key,
    @required this.slide,
  }) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30.0),
      child: slide,
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
          _Dot(
            screenSize: screenSize,
            index: 0,
          ),
          _Dot(
            screenSize: screenSize,
            index: 1,
          ),
          _Dot(
            screenSize: screenSize,
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.screenSize,
    @required this.index,
  }) : super(key: key);

  final Size screenSize;
  final int index;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: screenSize.height * 0.015,
      width: screenSize.height * 0.015,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (pageViewIndex.round() == index) ? Colors.orange : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
