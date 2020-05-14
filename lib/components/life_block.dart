import 'package:blue_box_flutter/components/block.dart';

import '../palette.dart';

class LifeBlock extends Block {
  LifeBlock() : super(23) {
    paint = Palette.green.paint;
  }

  @override
  void onPlayerColision() {
    gameRef.player.life++;
  }
}
