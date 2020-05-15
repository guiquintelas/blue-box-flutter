import 'dart:ui';

import 'package:flutter/material.dart';

class TextUtil {
  static TextStyle defaultTextStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'UnitedKingdom');

  static drawText(Canvas canvas, String text, Offset offset) {
    final textSpan = TextSpan(
      text: text,
      style: defaultTextStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(canvas, offset);
  }
}
