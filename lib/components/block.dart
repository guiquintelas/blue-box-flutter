import 'dart:math';
import 'dart:ui';

import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:flame/components/component.dart';

import '../palette.dart';

class Block extends PositionComponent {
  double size;
  double speed;
  BlueBoxGame game;

  Block(this.game) {
    size = 20;
    x = Random().nextDouble() * (game.screenSize.width - size);
    y = -size;
    speed = 2 + Random().nextDouble() * 5;
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, size, size), Palette.white.paint);
  }

  @override
  void update(double t) {
    fall();
    checkAlive();
  }

  void fall() {
    y += speed;
  }

  void checkAlive() {
    if (y >= game.screenSize.height) {
      game.components.remove(this);
    }
  }
}
