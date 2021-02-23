import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.blue,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: Text('Hola Mundo'),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: 175.0,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'CG',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Expanded(
                child: _OptionsList(),
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.blue,
                ),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: true,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: Colors.blue,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: true,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
