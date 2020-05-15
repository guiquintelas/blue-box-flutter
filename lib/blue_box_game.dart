import 'dart:ui';

import 'package:blue_box_flutter/gui/life_bar.dart';
import 'package:blue_box_flutter/my_base_game.dart';

import 'game_objects/enemy_block.dart';
import 'game_objects/life_block.dart';
import 'game_objects/player.dart';
import 'helpers/text_util.dart';

class BlueBoxGame extends MyBaseGame {
  bool debugMode() => true;

  @override
  void init() {
    add(player = Player());
    add(LifeBar());
  }

  @override
  void updateGame(double t) {
    addEnemyBlock();
    addLifeBlock();
  }

  void addEnemyBlock() {
    if (componentCount<EnemyBlock>() < 10) {
      add(EnemyBlock());
    }
  }

  void addLifeBlock() {
    if (componentCount<LifeBlock>() < 2) {
      add(LifeBlock());
    }
  }

  @override
  void renderGame(Canvas canvas) {}

  @override
  void restart() {
    dispose();
    init();
  }
}
