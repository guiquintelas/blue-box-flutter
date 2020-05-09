import 'dart:math';
import 'dart:ui';

import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:flame/components/component.dart';

import '../palette.dart';

abstract class Block extends Component {
  double x, y, size, speed;
  Paint paint = Palette.white.paint;
  BlueBoxGame game;

  Block(this.game, this.size) {
    x = Random().nextDouble() * (game.screenSize.width - size);
    y = -size;
    speed = 2 + Random().nextDouble() * 5;
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, size, size), paint);
  }

  @override
  void update(double t) {
    _fall();
    _checkAlive();
    _checkForPlayerColision();
  }

  void _fall() {
    y += speed;
  }

  void _checkAlive() {
    if (y >= game.screenSize.height) {
      game.remove(this);
    }
  }

  void _checkForPlayerColision() {
    Rect blockRect = Rect.fromLTWH(x, y, size, size);
    Rect playerRect = game.player.toRect();

    if (blockRect.overlaps(playerRect)) {
      onPlayerColision();
    }
  }

  void onPlayerColision();
}
