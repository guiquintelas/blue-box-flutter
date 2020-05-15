import 'dart:ui';

import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:blue_box_flutter/helpers/palette.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class Player extends Component with PanDetector, HasGameRef<BlueBoxGame> {
  double x, y;
  int life = 1;

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, size(), size()), Palette.blue.paint);
  }

  @override
  void update(double t) {}

  @override
  void onMount() {
    var yOffset = -30 - gameRef.screenHeightRatio * 150;

    x = gameRef.size.bottomCenter(Offset.zero).dx;
    y = gameRef.size.bottomCenter(Offset(0, yOffset)).dy;
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    x = details.globalPosition.dx - size() / 2;
  }

  Rect toRect() {
    return Rect.fromLTWH(x, y, size(), size());
  }

  bool destroy() {
    if (life <= 0) {
      return true;
    }

    return false;
  }

  @override
  void onDestroy() {
    gameRef.restart();
  }

  double size() => gameRef.size.width / scale();

  double scale() {
    return (12.0 + life / 3).clamp(12.0, 32.0);
  }
}
