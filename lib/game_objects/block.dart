import 'dart:math';
import 'dart:ui';

import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:blue_box_flutter/helpers/palette.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

abstract class Block extends Component with HasGameRef<BlueBoxGame> {
  double x, y, size, speed;
  Paint paint = Palette.white.paint;

  bool _shouldDestroy = false;
  bool destroy() => _shouldDestroy;

  Block(this.size);

  @override
  void onMount() {
    x = Random().nextDouble() * (gameRef.size.width - size);
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
    if (y >= gameRef.size.height) {
      _shouldDestroy = true;
    }
  }

  void _checkForPlayerColision() {
    Rect blockRect = Rect.fromLTWH(x, y, size, size);
    Rect playerRect = gameRef.player.toRect();

    if (blockRect.overlaps(playerRect)) {
      onPlayerColision();
      _shouldDestroy = true;
    }
  }

  void onPlayerColision();
}
