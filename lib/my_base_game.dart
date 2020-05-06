import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'components/player.dart';
import 'components/text_util.dart';

class MyBaseGame extends BaseGame with PanDetector {
  Player player;
  Size screenSize;
  bool isInit = false;

  List<Component> _componentsToRemove = [];

  void remove(Component component) {
    _componentsToRemove.add(component);
  }

  void _removeComponentsWaiting() {
    _componentsToRemove.forEach((element) {
      components.remove(element);
    });
    _componentsToRemove.clear();
  }

  void _renderFPS(Canvas canvas) {
    TextUtil.drawText(
        canvas, "FPS: ${fps().toStringAsFixed(0)}", Offset(10, 10));
  }

  int componentCount<T>() {
    int count = 0;

    components.forEach((component) {
      if (component is T) {
        count++;
      }
    });

    return count;
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;

    init();
    isInit = true;
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    if (!isInit) return;

    super.onPanUpdate(details);
    this.player.onPanUpdate(details);

    for (var component in this.components) {
      if (component is PanDetector) {
        (component as PanDetector).onPanUpdate(details);
      }
    }
  }

  void init() {
    add(player = Player());
  }

  @override
  void update(double t) {
    if (!isInit) return;

    _removeComponentsWaiting();
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (debugMode()) {
      _renderFPS(canvas);
    }
  }
}
