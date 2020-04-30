import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'paints.dart' as Paints;

class BlueBoxGame extends Game with PanDetector {
  Size screenSize;
  double playerX;
  double playerY;

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    canvas.drawRect(bgRect, Paints.black());

    canvas.drawRect(Rect.fromLTWH(playerX, playerY, 30, 30), Paints.primary());
  }

  void update(double t) {}

  void screenInitialized() {
    playerX = screenSize.bottomCenter(Offset.zero).dx;
    playerY = screenSize.bottomCenter(Offset(0, -150)).dy;
  }

  void resize(Size size) {
    screenSize = size;
    screenInitialized();
    super.resize(size);
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    playerX = details.globalPosition.dx;
  }
}
