import 'package:alpha_02/scene_1_cnt.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'text.dart';
import 'dart:ui' hide TextStyle;
import 'package:flame/palette.dart';
import 'buttons.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(''),
            Expanded(
              child: GameWidget(game: SudokuGame()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text('Далее'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyGameContinue()),
            );
          }),
    ));
  }
}

class SudokuGame extends FlameGame with HasTappables {
  //@override
  //Navigator.push()
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(Grid());
    add(Buttons());
    add(MyTextBox('')..position = Vector2(200, 600));
    add(Pass('')
      ..position = Vector2(480, 440)
      ..angle = -0.7);
  }

  @override
  Color backgroundColor() => const Color(0xFF38607C);
}

final style = TextStyle(color: BasicPalette.white.color);
final regular = TextPaint(style: style);

class Grid extends SpriteComponent {
  Grid() : super(size: Vector2.all(1));
  Future<void> onLoad() async {
    sprite = await Sprite.load('board.png');
    size = Vector2(360, 360);
    position = Vector2(456, 180);
  }
}

class Buttons extends FlameGame with HasTappables {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //1-st vertical line
    add(Button()..position = Vector2(470, 190));
    add(Button()..position = Vector2(470, 307));
    add(Button()..position = Vector2(470, 415));
    //2-nd vertical line
    add(Button()..position = Vector2(580, 190));
    add(Button()..position = Vector2(580, 307));
    add(Button()..position = Vector2(580, 415));
    //3-rd vertical line
    add(Button()..position = Vector2(690, 190));
    add(Button()..position = Vector2(690, 307));
    add(Button()..position = Vector2(690, 415));
  }
}














//класс для бэкграунда
//class Bg extends SpriteComponent {
  //Future<void> onLoad() async {
    //sprite = await Sprite.load('background.png');
    //anchor = Anchor.center;
  //}
//}










