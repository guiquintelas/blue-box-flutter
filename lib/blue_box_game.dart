import 'package:blue_box_flutter/components/block.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'components/player.dart';

class BlueBoxGame extends BaseGame with PanDetector {
  Player player;
  Size screenSize;
  bool isInit = false;

  @override
  void onPanUpdate(DragUpdateDetails details) {
    if (!isInit) return;

    super.onPanUpdate(details);
    this.player.onPanUpdate(details);

    for (var component in this.components) {
      if (component is PanDetector) {
        (component as PanDetector).onPanUpdate(details);
      }
    }
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;

    init();
    isInit = true;
  }

  void init() {
    add(player = Player());
  }

  @override
  void update(double t) {
    if (!isInit) return;

    super.update(t);
    addBlock();
  }

  int componentCount<T>() {
    int count = 0;

    components.forEach((component) {
      if (component is T) {
        count++;
      }
    });

    return count;
  }

  void addBlock() {
    if (componentCount<Block>() < 10) {
      add(Block(this));
    }
  }
}
