import 'package:flutter/material.dart';

class PinterestButton {
  const PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });

  final Function onPressed;
  final IconData icon;
}

class PrinterestMenu extends StatelessWidget {
  const PrinterestMenu({Key key}) : super(key: key);

  static final List<PinterestButton> buttons = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () => print('Icon pie_chart')),
    PinterestButton(icon: Icons.search, onPressed: () => print('Icon search')),
    PinterestButton(icon: Icons.notifications, onPressed: () => print('Icon notifications')),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: () => print('Icon supervised_user_circle')),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinterestMenuBackground(child: _MenuItems(menuItems: buttons)),
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
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
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
    this.menuItems,
  }) : super(key: key);

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index: index, item: menuItems[index])),
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
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25.0,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
