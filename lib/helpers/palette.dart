library paints;

import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Palette {
  static PaletteEntry white = BasicPalette.white;
  static PaletteEntry black = BasicPalette.black;
  static PaletteEntry blue = PaletteEntry(Color(0xFF0000ff));
  static PaletteEntry green = PaletteEntry(Color.fromARGB(255, 50, 255, 50));
}
