import 'package:flutter/material.dart';

const Map<int, Color> _colorSwatch = {
  50: Color(0xFFC11357),
  100: Color(0xFFFF6F8F), // Cor um pouco mais escura
  200: Color(0xFFFF3D6E), // Cor média
  300: Color(0xFFFF2C5A), // Cor escura
  400: Color(0xFFC11357), // Cor mais escura
};

abstract class CustomColors {
  static Color customContrastColor = const Color(0xFF0A0A0A);

  static MaterialColor customSwatchColor = const MaterialColor(0xFFC11357, _colorSwatch);

  // Método para obter uma cor específica do swatch
  static Color getColor(int opacityLevel) {
    return _colorSwatch[opacityLevel] ?? customContrastColor; // Retorna a cor ou uma cor padrão
  }
}