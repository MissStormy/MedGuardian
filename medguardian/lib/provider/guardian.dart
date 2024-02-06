import 'package:flutter/material.dart';

class GuardianModeProvider extends ChangeNotifier {
  bool _guardianModeEnabled = false;

  bool get guardianModeEnabled => _guardianModeEnabled;

  set guardianModeEnabled(bool value) {
    _guardianModeEnabled = value;
    notifyListeners();
  }

  void toggleGuardianMode() {
    _guardianModeEnabled = !_guardianModeEnabled;
    notifyListeners();
  }
}
