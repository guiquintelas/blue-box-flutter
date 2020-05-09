import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:blue_box_flutter/palette.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class Player extends Component with PanDetector {
  Size screenSize;

  double x, y, size = 30;
  int life = 1;

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, size, size), Palette.blue.paint);
  }

  @override
  void update(double t) {}

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    x = screenSize.bottomCenter(Offset.zero).dx;
    y = screenSize.bottomCenter(Offset(0, -150)).dy;
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    x = details.globalPosition.dx;
  }

  Rect toRect() {
    return Rect.fromLTWH(x, y, size, size);
  }
}
