import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/blue_box_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BlueBoxGame game = BlueBoxGame();
  runApp(game.widget);
}
