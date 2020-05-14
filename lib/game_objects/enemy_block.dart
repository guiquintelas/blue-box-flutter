import 'block.dart';

class EnemyBlock extends Block {
  EnemyBlock() : super(20);

  @override
  void onPlayerColision() {
    gameRef.player.life--;
  }
}
