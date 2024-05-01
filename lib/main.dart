import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'flappy_jagger.dart';
void main() {
  runApp(
    const GameWidget<FlappyJaggerGame>.controlled(
      gameFactory: FlappyJaggerGame.new
    )
  );
}