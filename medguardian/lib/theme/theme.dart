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

  bool get darkTheme => this._darkTheme;
  ThemeData get actualTheme => this._theme;

  ThemeLoader(int theme) {
    //lock active theme
    switch (theme) {
      case 0:
        //this_theme = _myLightTheme();
        this._lightTheme = true;
        this._darkTheme = false;
        break;
      case 1:
        this._theme = _myDarkTheme();
        this._lightTheme = false;
        this._darkTheme = true;
        break;
      default:
        this._theme = _myDarkTheme();
        this._darkTheme = true;
        break;
    }
  }

  set darkTheme(bool value) {
    this._darkTheme = value;
    this._lightTheme = !value;
    //lock active theme
    if (value) {
      //modify value of dark theme for our app
      this._theme = _myDarkTheme();
    } else {
      this._theme = _myLightTheme();
    }
    notifyListeners();
  }

  set lightTheme(bool value) {
    this._lightTheme = value;
    this._darkTheme = !value;
    //lock active theme
    if (value) {
      //modify value of light theme for our app
      this._theme = _myLightTheme();
    } else {
      this._theme = _myDarkTheme();
    }
    notifyListeners();
  }

  //Palette: Spring Blossom
  ThemeData _myLightTheme() {
    return (ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        primary: Color(0xFFE7CAC2), // Pure Pink
        secondary: Color(0xFFCEBEB9), // Off Pink
        background: Color(0xFFE2E0D4), // Cream
        surface: Color(0xFF959595), // Grey
        onPrimary: Colors.black, // Text color on top of the primary color
        onSecondary: Colors.black, // Text color on top of the secondary color
        onBackground: Colors.black, // Text color on top of the background color
        onSurface: Colors.black, // Text color on top of the surface color
        brightness: Brightness.light, // Light theme
        error: Color(0xFFFF6E40), // Error color
        onError: Color(0xFFECEFF1), // Text color on top of the error color
      ),
    ));
  }

  //Palette: Latte
  ThemeData _myDarkTheme() {
    return (ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        primary: Color(0xFF8F614B), // Caramel
        secondary: Color(0xFFB69B7D), // Heavy Cream
        background: Color(0xFF382A1D), // Mocha
        surface: Color(0xFF070502), // Black
        onPrimary: Colors.white, // Text color on top of the primary color
        onSecondary: Colors.white, // Text color on top of the secondary color
        onBackground: Colors.white, // Text color on top of the background color
        onSurface: Colors.white, // Text color on top of the surface color
        brightness: Brightness.dark, // Dark theme
        error: Color(0xFFFF6E40), // Error color
        onError: Color(0xFFECEFF1), // Text color on top of the error color
      ),
    ));
  }
}
