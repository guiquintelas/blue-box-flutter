import 'block.dart';

class EnemyBlock extends Block {
  EnemyBlock() : super(24.6);

  @override
  void onPlayerColision() {
    gameRef.player.life--;
  }
}
