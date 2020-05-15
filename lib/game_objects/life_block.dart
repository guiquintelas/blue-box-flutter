import 'package:blue_box_flutter/helpers/palette.dart';

import 'block.dart';

class LifeBlock extends Block {
  LifeBlock() : super(26) {
    paint = Palette.green.paint;
  }

  @override
  void onPlayerColision() {
    gameRef.player.life++;
  }
}
