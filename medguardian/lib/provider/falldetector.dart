import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerProvider extends ChangeNotifier {
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  double _fallThreshold = 10.0;
  bool _isFallDetected = false;

  AccelerometerProvider() {
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      final double speed = event.x.abs() + event.y.abs() + event.z.abs();
      if (speed > _fallThreshold) {
        _isFallDetected = true;
        notifyListeners();
      } else {
        _isFallDetected = false;
        notifyListeners();
      }
    });
  }

  double get fallThreshold => _fallThreshold;

  set fallThreshold(double value) {
    _fallThreshold = value;
    notifyListeners();
  }

  bool get isFallDetected => _isFallDetected;

  void _initAccelerometer() {
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      final double speed = event.x.abs() + event.y.abs() + event.z.abs();
      if (speed > _fallThreshold) {
        _isFallDetected = true;
        notifyListeners();
      } else {
        _isFallDetected = false;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }
}
