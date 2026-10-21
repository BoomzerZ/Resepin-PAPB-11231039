import 'package:flutter/services.dart';

abstract class OrientationConfig {
  static Future<void> setPortrait() => SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  static Future<void> allowLandscape() =>
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
}
