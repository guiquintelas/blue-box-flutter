import 'dart:ui';

import 'package:blue_box_flutter/gui/life_bar.dart';
import 'package:blue_box_flutter/my_base_game.dart';

import 'game_objects/enemy_block.dart';
import 'game_objects/life_block.dart';
import 'game_objects/player.dart';

class BlueBoxGame extends MyBaseGame {
  bool debugMode() => true;

  @override
  void init() {
    super.init();
    add(player = Player());
    add(LifeBar());
  }

  @override
  void updateGame(double t) {
    addEnemyBlock();
    addLifeBlock();
  }

  void addEnemyBlock() {
    EnemyBlock.nextConter += EnemyBlock.createRate(timePlayed);

    while (EnemyBlock.nextConter > 1) {
      EnemyBlock.nextConter--;
      add(EnemyBlock());
    }
  }

  void addLifeBlock() {
    LifeBlock.nextConter += LifeBlock.createRate();

    while (LifeBlock.nextConter > 1) {
      LifeBlock.nextConter--;
      add(LifeBlock());
    }
  }

  @override
  void renderGame(Canvas canvas) {}
}
