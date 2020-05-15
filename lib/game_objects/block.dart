import 'dart:math';
import 'dart:ui';

import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:blue_box_flutter/helpers/palette.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

abstract class Block extends Component with HasGameRef<BlueBoxGame> {
  double x, y, size, speed, scale;
  Paint paint = Palette.white.paint;

  bool _shouldDestroy = false;
  bool destroy() => _shouldDestroy;

  Block(this.scale);

  @override
  void onMount() {
    size = gameRef.size.width / scale;
    x = Random().nextDouble() * (gameRef.size.width - size);
    y = -size;

    speed = minSpeed() + Random().nextDouble() * maxSpeed();
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, size, size), paint);
  }

  @override
  void update(double dt) {
    _fall(dt);
    _checkAlive();
    _checkForPlayerColision();
  }

  void _fall(double dt) {
    y += speed * dt * gameRef.screenWidthRatio;
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

  double minSpeed() => 100 + gameRef.timePlayed.clamp(0.0, 60 * 7.0) * 2;
  double maxSpeed() => 200;
  static double createRate() => 1;

  void onPlayerColision();
}
