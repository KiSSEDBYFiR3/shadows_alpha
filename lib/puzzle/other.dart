//для случая масштабирования пол экран телефона
/* @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    position = (gameSize / 2) + Vector2(-167, -167);
  } */




/*class End extends Button {
  static final Paint _red = Paint()..color = const Color(0xFFDC0215);
  End()
      : super(size: Vector2.all(400),
  );
} */



/* class GlobalContainer extends PositionComponent with Tappable {
  final Paint _black = Paint()..color = const Color(0xFF000000);
  GlobalContainer()
      : super(
    size: Vector2.all(400),
  );
} */


/* class Container0 extends GlobalContainer {
  int counter0 = 0;
  @override
  bool onTapDown(_) {
    counter0 += 1;
    return true;
  }


  @override
  void render(Canvas canvas) {
    if (counter0 > 8) {
      canvas.drawRect(size.toRect(), _black);
    }
  }
}  */

// add(Container0()..position = Vector2(470, 190));
// add(Container0()..position = Vector2(470, 307));
// add(Container0()..position = Vector2(470, 415));