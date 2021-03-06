import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'game_objects/player.dart';
import 'helpers/text_util.dart';

abstract class MyBaseGame extends BaseGame with PanDetector {
  Player player;
  bool initialized = false;
  bool paused = true;

  double timePlayed;
  double screenHeightRatio;
  double screenWidthRatio;

  @override
  void resize(Size size) {
    Size beforeSize = this.size;
    super.resize(size);

    if (beforeSize == null && this.size != null) {
      initialized = true;
      screenHeightRatio = size.height / 868.0;
      screenWidthRatio = size.width / 411.0;
      this.init();
    }
  }

  void dispose() {
    components.clear();
  }

  void restart() {
    dispose();
    init();
  }

  @override
  void update(double t) {
    if (!initialized || paused) return;

    timePlayed += t;
    updateGame(t);
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    if (!initialized) return;

    super.render(canvas);
    renderGame(canvas);

    _renderTime(canvas);

    if (debugMode()) {
      _renderFPS(canvas);
    }
  }

  void _renderFPS(Canvas canvas) {
    TextUtil.drawText(
        canvas, "FPS: ${fps().toStringAsFixed(0)}", Offset(10, 30));
  }

  void _renderTime(Canvas canvas) {
    int minutes = (timePlayed / 60).floor();
    int seconds = (timePlayed % 60).floor();

    String minuteStr = minutes > 9 ? "$minutes" : "0$minutes";
    String secondStr = seconds > 9 ? "$seconds" : "0$seconds";

    TextUtil.drawText(canvas, "TIME: $minuteStr:$secondStr", Offset(10, 0));
  }

  void init() {
    timePlayed = 0;
  }

  void updateGame(double t);
  void renderGame(Canvas canvas);

  int componentCount<T>() {
    int count = 0;

    components.forEach((component) {
      if (component is T) {
        count++;
      }
    });

    return count;
  }

  @override
  void onPanDown(DragDownDetails details) {
    if (!initialized) return;
    player.handlePan(details.globalPosition.dx);
    paused = false;
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    if (!initialized) return;
    player.handlePan(details.globalPosition.dx);
    paused = false;
  }

  @override
  void onPanEnd(DragEndDetails details) {
    paused = true;
  }

  @override
  void onPanCancel() {
    paused = true;
  }
}
