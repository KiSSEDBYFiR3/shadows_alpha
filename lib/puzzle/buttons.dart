import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

class Button extends PositionComponent with Tappable {
  static final Paint _white = Paint()..color = const Color(0xFFFFFFFF);
  static final Paint _grey = Paint()..color = const Color(0xFFA5A5A5);
  static final Paint _orange = Paint()..color = const Color(0xFFDC5915);
  static final Paint _red = Paint()..color = const Color(0xFFDC0215);
  static final Paint _green = Paint()..color = const Color(0xFF74CF15);
  static final Paint _blue = Paint()..color = const Color(0xFF0000FF);
  static final Paint _cyan = Paint()..color = const Color(0xFF00CBFF);
  static final Paint _black = Paint()..color = const Color(0xFF000000);
  static final Paint _violet = Paint()..color = const Color(0xFF46256D);
  int count = 0;

  Button()
      : super(
          size: Vector2.all(112),
        );

  @override
  bool onTapDown(_) {
    count += 1;
    return true;
  }

  @override
  void render(Canvas canvas) {
    if (count == 0) {
      canvas.drawRect(size.toRect(), _white);
    } else if (count == 1) {
      canvas.drawRect(size.toRect(), _grey);
    } else if (count == 2) {
      canvas.drawRect(size.toRect(), _orange);
    } else if (count == 3) {
      canvas.drawRect(size.toRect(), _red);
    } else if (count == 4) {
      canvas.drawRect(size.toRect(), _green);
    } else if (count == 5) {
      canvas.drawRect(size.toRect(), _blue);
    } else if (count == 6) {
      canvas.drawRect(size.toRect(), _cyan);
    } else if (count == 7) {
      canvas.drawRect(size.toRect(), _black);
    } else if (count == 8) {
      canvas.drawRect(size.toRect(), _violet);
    }
  }
}




 /* class NextButton extends PositionComponent with Tappable {
  NextButton()
      : super(
    size: Vector2.all(112),
  );
  @override
  bool numberCheck() {
    keyboardType: TextInputType.number;


  }
} */























