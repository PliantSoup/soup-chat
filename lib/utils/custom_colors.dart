library colors;

import 'package:flutter/material.dart';

// Coffee-gold
const int _mainColor = 0xFF000000;
const int _secondaryColor = 0xFF181C24;
const int _fontColor = 0xFFE6D5B8;
// const int _selectedColor = 0xFFE45826;
const int _selectedColor = 0xFFFF5252;

class CustomColors {
  static const MaterialColor mainColor = MaterialColor(
    _mainColor,
    <int, Color>{
      50: Color(_mainColor),
      100: Color(_mainColor),
      200: Color(_mainColor),
      300: Color(_mainColor),
      400: Color(_mainColor),
      500: Color(_mainColor),
      600: Color(_mainColor),
      700: Color(_mainColor),
      800: Color(_mainColor),
      900: Color(_mainColor),
    },
  );
  static const MaterialColor secondaryColor = MaterialColor(
    _secondaryColor,
    <int, Color>{
      50: Color(_secondaryColor),
      100: Color(_secondaryColor),
      200: Color(_secondaryColor),
      300: Color(_secondaryColor),
      400: Color(_secondaryColor),
      500: Color(_secondaryColor),
      600: Color(_secondaryColor),
      700: Color(_secondaryColor),
      800: Color(_secondaryColor),
      900: Color(_secondaryColor),
    },
  );
  static const MaterialColor fontColor = MaterialColor(
    _fontColor,
    <int, Color>{
      50: Color(_fontColor),
      100: Color(_fontColor),
      200: Color(_fontColor),
      300: Color(_fontColor),
      400: Color(_fontColor),
      500: Color(_fontColor),
      600: Color(_fontColor),
      700: Color(_fontColor),
      800: Color(_fontColor),
      900: Color(_fontColor),
    },
  );
  static const MaterialColor selectedColor = MaterialColor(
    _selectedColor,
    <int, Color>{
      50: Color(_selectedColor),
      100: Color(_selectedColor),
      200: Color(_selectedColor),
      300: Color(_selectedColor),
      400: Color(_selectedColor),
      500: Color(_selectedColor),
      600: Color(_selectedColor),
      700: Color(_selectedColor),
      800: Color(_selectedColor),
      900: Color(_selectedColor),
    },
  );
}
