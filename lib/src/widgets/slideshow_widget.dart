import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    Key key,
    @required this.slides,
    this.dotsOnTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  }) : super(key: key);

  final List<Widget> slides;
  final bool dotsOnTop;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor = this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor = this.secondaryColor; 
              return _CreateColumnSlideshow(dotsOnTop: dotsOnTop, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateColumnSlideshow extends StatelessWidget {
  const _CreateColumnSlideshow({
    Key key,
    @required this.dotsOnTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotsOnTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotsOnTop) _Dots(this.slides.length),
        Expanded(child: _Slides(slides: this.slides)),
        if (!this.dotsOnTop) _Dots(this.slides.length),
      ],
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageController.page;
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
  const _Dots(
    this.totalSlides, {
    Key key,
  }) : super(key: key);

  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: screenSize.height * 0.015,
      width: screenSize.height * 0.015,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color:
            (slideshowModel.currentPage.round() == index) ? slideshowModel.primaryColor : slideshowModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color _primaryColor = Colors.blue;

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color _secondaryColor = Colors.grey;

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }
}
