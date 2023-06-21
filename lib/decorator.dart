import 'package:flutter/material.dart';

class Decorator {
  static Color _backgroundColorMain = const Color.fromRGBO(10, 9, 51, 1);
  static Color _backgroundColorLower = const Color.fromRGBO(6, 6, 30, 1);

  static BoxDecoration mainScreenDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [_backgroundColorMain, _backgroundColorLower],
    ),
  );
}
