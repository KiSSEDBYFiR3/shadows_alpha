import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'dart:ui' hide TextStyle;
import 'package:flame/palette.dart';
import 'package:flutter/material.dart' show Colors;

final custom = TextPaint(
    style: const TextStyle(
        fontFamily: 'Optimus Princeps', fontSize: 25, color: Colors.white));

class MyTextBox extends TextBoxComponent {
  MyTextBox(String text)
      : super(
            text: 'Нужное всегда сокрыто за тривиальным...',
            textRenderer: custom,
            boxConfig: TextBoxConfig(
                growingBox: true, maxWidth: 800 /*  timePerChar: 0.05  */));
  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color(0x64000000));
  }
}

final custom2 = TextPaint(
    style: const TextStyle(
        fontFamily: 'Optimus Princeps', fontSize: 50, color: Colors.white));

class Pass extends TextBoxComponent {
  Pass(String text)
      : super(
            text: '16-------78--------49',
            textRenderer: custom2,
            boxConfig: TextBoxConfig(growingBox: true, maxWidth: 20));
  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color(0x00000000));
  }
}
