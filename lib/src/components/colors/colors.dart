import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(255, 39, 1, .1),
  100: const Color.fromRGBO(255, 39, 1, .2),
  200: const Color.fromRGBO(255, 39, 1, .3),
  300: const Color.fromRGBO(255, 39, 1, .4),
  400: const Color.fromRGBO(255, 39, 1, .5),
  500: const Color.fromRGBO(255, 39, 1, .6),
  600: const Color.fromRGBO(255, 39, 1, .7),
  700: const Color.fromRGBO(255, 39, 1, .8),
  800: const Color.fromRGBO(255, 39, 1, .9),
  900: const Color.fromRGBO(255, 39, 1, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Color(0xFF0A0A0A);

  static MaterialColor customSwatchColor =
      MaterialColor(0xD9FF2701, _swatchOpacity);
}
