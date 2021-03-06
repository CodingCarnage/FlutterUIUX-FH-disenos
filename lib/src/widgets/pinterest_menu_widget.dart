import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PinterestButton {
  const PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });

  final Function onPressed;
  final IconData icon;
}

class PrinterestMenu extends StatelessWidget {
  const PrinterestMenu({
    Key key,
    @required this.buttons,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.black,
  }) : super(key: key);

  final List<PinterestButton> buttons;
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  // static final List<PinterestButton> buttons = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: () => print('Icon pie_chart')),
  //   PinterestButton(icon: Icons.search, onPressed: () => print('Icon search')),
  //   PinterestButton(icon: Icons.notifications, onPressed: () => print('Icon notifications')),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: () => print('Icon supervised_user_circle')),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (show) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items: buttons),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _MenuModel menuModel = Provider.of<_MenuModel>(context);
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: menuModel.backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({
    Key key,
    this.items,
  }) : super(key: key);

  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) => _PinterestMenuButton(index: index, item: items[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  const _PinterestMenuButton({
    Key key,
    this.index,
    this.item,
  }) : super(key: key);

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    final _MenuModel menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (menuModel.itemSelected == index) ? 35.0 : 25.0,
          color: (menuModel.itemSelected == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;

  int get itemSelected => this._itemSelected;

  set itemSelected(int itemSelected) {
    this._itemSelected = itemSelected;
    notifyListeners();
  }

  Color _backgroundColor = Colors.white;

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color backgroundColor) {
    this._backgroundColor = backgroundColor;
  }

  Color _activeColor = Colors.red;

  Color get activeColor => this._activeColor;

  set activeColor(Color activeColor) {
    this._activeColor = activeColor;
  }

  Color _inactiveColor = Colors.black;

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color inactiveColor) {
    this._inactiveColor = inactiveColor;
  }
}
