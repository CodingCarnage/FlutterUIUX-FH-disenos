import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //* Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.orange);
        break;
      case 2: //* Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.orange);
        break;
      case 3: //* Custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool darkTheme) {
    this._customTheme = false;
    this._darkTheme = darkTheme;
    if (darkTheme) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.orange);
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.orange);
    }
    notifyListeners();
  }

  set customTheme(bool customTheme) {
    this._darkTheme = false;
    this._customTheme = customTheme;
    if (customTheme) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.orange);
    }
    notifyListeners();
  }
}
