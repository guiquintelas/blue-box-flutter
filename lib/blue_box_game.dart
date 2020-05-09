import 'dart:ui';

import 'package:blue_box_flutter/components/enemy_block.dart';
import 'package:blue_box_flutter/components/life_block.dart';
import 'package:blue_box_flutter/my_base_game.dart';

class BlueBoxGame extends MyBaseGame {
  bool debugMode() => true;

  @override
  void updateGame(double t) {
    addEnemyBlock();
    addLifeBlock();
  }

  void addEnemyBlock() {
    if (componentCount<EnemyBlock>() < 10) {
      add(EnemyBlock(this));
    }
  }

  void addLifeBlock() {
    if (componentCount<LifeBlock>() < 2) {
      add(LifeBlock(this));
    }
  }

  @override
  void renderGame(Canvas canvas) {}
}
