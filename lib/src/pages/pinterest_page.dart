import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos/src/widgets/pinterest_menu_widget.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool showMenu = Provider.of<_MenuModel>(context).showMenu;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PrinterestMenu(
          show: showMenu,
          activeColor: Colors.orange,
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController = new ScrollController();
  double scrollOldValue = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollOldValue && scrollController.offset > 100) {
        Provider.of<_MenuModel>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).showMenu = true;
      }
      scrollOldValue = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
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

class _MenuModel with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => this._showMenu;

  set showMenu(bool showMenu) {
    this._showMenu = showMenu;
    notifyListeners();
  }
}
