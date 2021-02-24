import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/routes/routes.dart';

import 'package:disenos/src/theme/theme.dart';

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
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageRoutes[index].page,
            ),
          );
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
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
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
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
                  value: appTheme.darkTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) => appTheme.darkTheme = value,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: Colors.blue,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
