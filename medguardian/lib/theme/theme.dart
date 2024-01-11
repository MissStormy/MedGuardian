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

  ThemeData _myLightTheme() {
    return (ThemeData.light().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF738290), // Text color
          secondary: Color(0xFFA1B5D8), // Accent color
          background: Color(0xFFFFFCF7), // Background color
          surface: Color(0xFFE4F0D0), // Secondary color
          onBackground:
              Color(0xFFCFE1F4), // Text color on top of the background color
          onSurface:
              Color(0xFF0D0D0D), // Text color on top of the surface color
          brightness: Brightness.light,
          error: Color(0xFFFF6E40),
          onError: Color(0xFFECEFF1),
          onPrimary:
              Colors.black, // Placeholder color, replace with actual color
          onSecondary:
              Colors.black, // Placeholder color, replace with actual color
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
                color: Color(0xFF0D0D0D)))));
  }

  //Palette: Buzzing Bee
  // ThemeData _myLightTheme() {
  //   return (ThemeData.light().copyWith(
  //       colorScheme: const ColorScheme(
  //     primary: Color(0xFF8F614B), // Text color
  //     secondary: Color(0xFFFEDB71), // Accent color
  //     background: Color(0xFFDD868C), // Background color
  //     surface: Color(0xFF8F614B), // Secondary color
  //     onPrimary: Color(0xFFFFFFFF), // Text color on top of the primary color
  //     onSecondary:
  //         Color(0xFF140F1F), // Text color on top of the secondary color
  //     onBackground:
  //         Color(0xFF140F1F), // Text color on top of the background color
  //     onSurface: Color(0xFF140F1F), // Text color on top of the surface color
  //     brightness: Brightness.light,
  //     error: Color(0xFFFF6E40),
  //     onError: Color(0xFFECEFF1),
  //   )));
  // }

  //Palette: Latte Green
  ThemeData _myDarkTheme() {
    return (ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF172621),
          secondary: Color(0xFF2A4038),
          background: Color(0xFF0D0D0D),
          surface: Color(0xFF0D0D0D),
          onBackground: Color(0xFF4D734C),
          onSurface: Color(0xFF4D734C),
          brightness: Brightness.dark,
          error: Color(0xFFFF6E40),
          onError: Color(0xFFECEFF1),
          onPrimary: Color(0xFF4D734C),
          onSecondary: Color(0xFF4D734C),
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
                color: Color(0xFFECEFF1)))));

                
    //Palette: Blue Bert
    // ThemeData _myDarkTheme() {
    //   return (ThemeData.dark().copyWith(
    //       colorScheme: const ColorScheme(
    //     primary: Color(0xFF66FCF1), // Text color
    //     secondary: Color(0xFF45A29E), // Accent color
    //     background: Color(0xFF0B0C10), // Background color
    //     surface: Color(0xFF1F2833), // Secondary color
    //     onPrimary: Color(0xFFC5C6C7), // Text color on top of the primary color
    //     onSecondary:
    //         Color(0xFF66FCF1), // Text color on top of the secondary color
    //     onBackground:
    //         Color(0xFFC5C6C7), // Text color on top of the background color
    //     onSurface: Color(0xFFC5C6C7), // Text color on top of the surface color
    //     brightness: Brightness.dark,
    //     error: Color(0xFFFF6E40),
    //     onError: Color(0xFFECEFF1),
    //   )));
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
