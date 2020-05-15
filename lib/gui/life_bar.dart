import 'dart:ui';

import 'package:blue_box_flutter/helpers/palette.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

import '../blue_box_game.dart';

class LifeBar extends Component with HasGameRef<BlueBoxGame> {
  static double lifeSize;
  static double lifeSpacing;
  static double bottomPadding = 80;
  static double topPadding;

  static int maxColumnLifeCount;

  @override
  void onMount() {
    lifeSize = 11 * gameRef.screenWidthRatio;
    lifeSpacing = 7 * gameRef.screenWidthRatio;
    topPadding = lifeSize;

    maxColumnLifeCount = ((gameRef.size.height - bottomPadding - topPadding) /
            (lifeSize + lifeSpacing))
        .ceil();
  }

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
        Rect.fromLTWH(getLifeX(index), getLifeY(index), lifeSize, lifeSize),
        Palette.green.paint);
  }

  int _getLifeColmun(int index) {
    return (index / maxColumnLifeCount).floor();
  }

  double getLifeX(int index) {
    return _getLifeColmun(index) * (lifeSpacing + lifeSize) + lifeSpacing;
  }

  double getLifeY(int index) {
    return gameRef.size.height -
        bottomPadding -
        ((index % maxColumnLifeCount) * (lifeSize + lifeSpacing));
  }

  @override
  int priority() {
    return 1000;
  }
}
