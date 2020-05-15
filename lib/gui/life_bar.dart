import 'dart:ui';

import 'package:blue_box_flutter/helpers/palette.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

import '../blue_box_game.dart';

class LifeBar extends Component with HasGameRef<BlueBoxGame> {
  static const double LIFE_SIZE = 11;
  static const double LIFE_SPACING = 7;
  static const double BOTTOM_PADDING = 80;

  @override
  void render(Canvas c) {
    for (var i = 0; i < gameRef.player.life; i++) {
      _drawLife(c, i);
    }
  }

  @override
  void update(double t) {}

  void _drawLife(Canvas c, int index) {
    c.drawRect(
        Rect.fromLTWH(getLifeX(index), getLifeY(index), LIFE_SIZE, LIFE_SIZE),
        Palette.green.paint);
  }

  int _getMaxColumnLife() {
    return ((gameRef.size.height - BOTTOM_PADDING) / (LIFE_SIZE + LIFE_SPACING))
        .ceil();
  }

  int _getLifeColmun(int index) {
    return ((index * (LIFE_SIZE + LIFE_SPACING)) /
            (gameRef.size.height - BOTTOM_PADDING))
        .floor();
  }

  double getLifeX(int index) {
    return _getLifeColmun(index) * (LIFE_SPACING + LIFE_SIZE) + LIFE_SPACING;
  }

  double getLifeY(int index) {
    return gameRef.size.height -
        BOTTOM_PADDING -
        ((index % _getMaxColumnLife()) * (LIFE_SIZE + LIFE_SPACING));
  }

  @override
  int priority() {
    return 1000;
  }
}
