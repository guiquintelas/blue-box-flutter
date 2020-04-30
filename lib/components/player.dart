import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:blue_box_flutter/palette.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class Player extends PositionComponent with PanDetector {
  double size;
  Size screenSize;

  Player() {
    this.size = 30;
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(this.x, this.y, this.size, this.size),
        Palette.blue.paint);
  }

  @override
  void update(double t) {}

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    this.x = screenSize.bottomCenter(Offset.zero).dx;
    this.y = screenSize.bottomCenter(Offset(0, -150)).dy;
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    this.x = details.globalPosition.dx;
  }
}
