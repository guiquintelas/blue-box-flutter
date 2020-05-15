import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'game_objects/player.dart';
import 'helpers/text_util.dart';

abstract class MyBaseGame extends BaseGame with PanDetector {
  Player player;
  bool isInit = false;

  double timePlayed;
  double screenHeightRatio;
  double screenWidthRatio;

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);

    for (var component in this.components) {
      if (component is PanDetector) {
        (component as PanDetector).onPanUpdate(details);
      }
    }
  }

  @override
  void resize(Size size) {
    Size beforeSize = this.size;
    super.resize(size);

    if (beforeSize == null && this.size != null) {
      isInit = true;
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
    if (!isInit) return;

    timePlayed += t;
    updateGame(t);
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    if (!isInit) return;

    super.render(canvas);
    renderGame(canvas);

    if (debugMode()) {
      _renderFPS(canvas);
    }
  }

  void _renderFPS(Canvas canvas) {
    TextUtil.drawText(
        canvas, "FPS: ${fps().toStringAsFixed(0)}", Offset(10, 0));
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
}
