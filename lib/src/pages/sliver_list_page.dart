import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            child: _ButtonNewList(),
            bottom: -10,
            right: -10,
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30.0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(
            'New',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Stack(
          children: <Widget>[
            Container(width: MediaQuery.of(context).size.width * 0.225),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD93A30),
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListTasks extends StatelessWidget {
  const _ListTasks({
    Key key,
  }) : super(key: key);

  static final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(
    this.text,
    this.color, {
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;

    return Container(
      height: screenSize * 0.125,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key key}) : super(key: key);

  static final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: screenSize * 0.225,
            maxHeight: screenSize * 0.2375,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Header(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ],
      physics: BouncingScrollPhysics(),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: size.height * 0.125,
      child: RaisedButton(
        onPressed: () {},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
        ),
      ),
    );
  }
}
