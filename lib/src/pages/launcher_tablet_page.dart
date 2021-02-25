import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/models/layout_model.dart';

import 'package:disenos/src/routes/routes.dart';

import 'package:disenos/src/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MainMenu(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: _OptionsList(),
          ),
          Container(
              width: 0.5,
              height: double.infinity,
              color: (appTheme.darkTheme) ? Colors.grey : appTheme.currentTheme.accentColor),
          Expanded(
            child: layoutModel.currentPage,
          ),
        ],
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.accentColor,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[index].page;
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
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text(
                    'CG',
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: appTheme.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: _OptionsList(),
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: appTheme.currentTheme.accentColor,
                ),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: appTheme.currentTheme.accentColor,
                  onChanged: (value) => appTheme.darkTheme = value,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.accentColor,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.accentColor,
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
