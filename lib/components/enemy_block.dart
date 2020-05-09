import 'package:blue_box_flutter/blue_box_game.dart';

import 'block.dart';

class EnemyBlock extends Block {
  EnemyBlock(BlueBoxGame game) : super(game, 20);

  @override
  void onPlayerColision() {
    game.player.life--;
    game.remove(this);
  }
}
