import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'actors/jagger.dart';
import 'actors/titan_enemy.dart';
import 'managers/segment_manager.dart';
import 'objects/ground_block.dart';
import 'objects/platform_block.dart';
import 'objects/star.dart';

class FlappyJaggerGame extends FlameGame {
  late JaggerPlayer _jagger;
  double objectSpeed = 0.0;

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
        case PlatformBlock:
          add(PlatformBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
        case Star:
          world.add(
            Star(
              gridPosition: block.gridPosition,
              xOffset: xPositionOffset,
            ),
          );
        case TitanEnemy:
      }
    }
  }

  void initializeGame() {
    // Assume that size.x < 3200
    print(size.x);
    final segmentsToLoad = (size.x / 640).ceil();

    print(segmentsToLoad);
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _jagger = JaggerPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_jagger);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

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


    double mapHeight = 640;
  
    camera.viewfinder.anchor = Anchor.topLeft;
    camera.viewport = FixedResolutionViewport(resolution: Vector2(1800, mapHeight));

//    Left -  Right
//     0   -  100
//    Down -   Up

    _jagger = JaggerPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_jagger);
    initializeGame();
  }
}
