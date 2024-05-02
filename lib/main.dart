import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'flappy_jagger.dart';

void main() {

  // changing orientation for mobile
  // WidgetsFlutterBinding.ensureInitialized();
  // Flame.device.fullScreen();
  // Flame.device.setLandscape();
  runApp(const GameWidget<FlappyJaggerGame>.controlled(
      gameFactory: FlappyJaggerGame.new));
}
