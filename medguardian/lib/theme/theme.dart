import 'package:flutter/material.dart';

/// Class that loads the application theme
/// Allows switching between light and dark themes
/// If 0 is passed in the constructor, it loads the light theme
/// If 1 is passed in the constructor, it loads the dark theme
/// If any other value is passed in the constructor, it loads the light theme

class ThemeLoader with ChangeNotifier {
  late ThemeData _theme;

  bool _darkTheme = false;
  bool _lightTheme = false;

  bool get darkTheme => _darkTheme;
  ThemeData get actualTheme => _theme;

  ThemeLoader(int theme) {
    //lock active theme
    switch (theme) {
      case 0:
        _theme = _myDarkTheme();
        _lightTheme = true;
        _darkTheme = false;
        break;
      case 1:
        _theme = _myLightTheme();
        _lightTheme = false;
        _darkTheme = true;
        break;
      default:
        _theme = _myDarkTheme();
        _darkTheme = true;
        break;
    }
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    _lightTheme = !value;
    //lock active theme
    if (value) {
      //modify value of dark theme for our app
      _theme = _myDarkTheme();
    } else {
      _theme = _myLightTheme();
    }
    notifyListeners();
  }

  set lightTheme(bool value) {
    _lightTheme = value;
    _darkTheme = !value;
    //lock active theme
    if (value) {
      //modify value of light theme for our app
      _theme = _myLightTheme();
    } else {
      _theme = _myDarkTheme();
    }
    notifyListeners();
  }

  //Light theme: Bathing ducks
  ThemeData _myLightTheme() {
    return (ThemeData.light().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF82ad85),
          secondary: Color(0xFF9dbb91),
          background: Color(0xFFdfc4c9),
          surface: Color(0xFFeef2e7),
          onBackground: Color(0xFFd3e8cc),
          onSurface: Color(0xFF0D0D0D),
          brightness: Brightness.light,
          error: Color(0xFFFF6E40),
          onError: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
                color: Color(0xFF0D0D0D)))));
  }

  //Palette: Latte Green
  ThemeData _myDarkTheme() {
    return (ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF1f3236),
          secondary: Color(0xFF34524a),
          background: Color(0xFF62846e),
          surface: Color(0xFF030e14),
          onBackground: Color(0xFF9cbb9c),
          onSurface: Color(0xFF4D734C),
          brightness: Brightness.dark,
          error: Color(0xFFFF6E40),
          onError: Color(0xFFECEFF1),
          onPrimary: Color(0xFF7a8a8c),
          onSecondary: Color(0xFF3f5354),
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
                color: Color(0xFFECEFF1)))));
  }
}

// Palette template
// primary: , // Text color
// secondary: , // Accent color
// background:, // Background color
// surface: , // Secondary color
// onPrimary: , // Text color on top of the primary color
// onSecondary:, // Text color on top of the secondary color
// onBackground: , // Text color on top of the background color
// onSurface: , // Text color on top of the surface color
// brightness: Brightness.light,
// error: Color(0xFFFF6E40),
// onError: Color(0xFFECEFF1),
