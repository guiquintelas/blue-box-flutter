import 'package:blue_box_flutter/blue_box_game.dart';
import 'package:blue_box_flutter/components/block.dart';

import '../palette.dart';

class LifeBlock extends Block {
  LifeBlock(BlueBoxGame game) : super(game, 23) {
    paint = Palette.green.paint;
  }

  @override
  void onPlayerColision() {
    game.player.life++;
  }
}
