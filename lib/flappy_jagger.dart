import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_flutter/actors/jagger.dart';

class FlappyJaggerGame extends FlameGame {
  
  late JaggerPlayer _jagger;
  
  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    
   _jagger = JaggerPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_jagger);
  }
}