import 'package:flame/components.dart';
import '../flappy_jagger.dart';

class JaggerPlayer extends SpriteAnimationComponent
    with HasGameReference<FlappyJaggerGame> {
  JaggerPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
