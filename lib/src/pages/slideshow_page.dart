import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos/src/models/slider_model.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key key}) : super(key: key);

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
    return Container(
      height: screenSize.height * 0.015,
      width: screenSize.height * 0.015,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (pageViewIndex == index) ? Colors.orange : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
