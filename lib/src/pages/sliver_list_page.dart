import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Header(),
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => _ListItem(),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;

    return Container(
      height: screenSize * 0.125,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30.0),
      child: Text(
        'Orange',
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
