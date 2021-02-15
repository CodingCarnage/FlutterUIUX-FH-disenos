import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  static final List items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index: index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestItem extends StatelessWidget {
  const PinterestItem({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
