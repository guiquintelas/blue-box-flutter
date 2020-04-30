import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'components/player.dart';

class BlueBoxGame extends BaseGame with PanDetector {
  Player player;

  BlueBoxGame() {
    add(this.player = Player());
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    this.player.onPanUpdate(details);

    for (var component in this.components) {
      if (component is PanDetector) {
        component.onPanUpdate(details);
      }
    }
  }
}
