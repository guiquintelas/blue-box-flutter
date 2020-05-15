import 'package:blue_box_flutter/helpers/palette.dart';

import 'block.dart';

class LifeBlock extends Block {
  static double nextConter = 0;

  LifeBlock() : super(26) {
    paint = Palette.green.paint;
  }

  @override
  void onPlayerColision() {
    gameRef.player.life++;
  }

  static double createRate() => .009;
}
