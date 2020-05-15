import 'block.dart';

class EnemyBlock extends Block {
  static double nextConter = 0;

  EnemyBlock() : super(24.6);

  @override
  void onPlayerColision() {
    gameRef.player.life--;
  }

  static double createRate(double timePlayed) => .02 + timePlayed / 400.0;
}
