import 'save_game.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(home: GameStart()));
}

class GameStart extends StatefulWidget {
  const GameStart({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GameStartState();
}

Image logo;
Image background;

class GameStartState extends State<GameStart> {
  @override
  void initState() {
    super.initState();
    logo = Image.asset('assets/chaos_star.png');
    background = Image.asset('assets/wastelands.jpg');
  }

  @override
  //виджет со стэком, в который передаются виджеты, котороые отрисовывают начальный экран
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Stack(
            children: [
              backgroundStartImage(),
              gameLogo(),
              gameName(),
              gameButtons(),
            ],
          )),
        ));
  }

  Widget gameLogo() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 0),
      child: logo,
    );
  }

  Widget backgroundStartImage() {
    return Center(
      child: background,
    );
  }

  Widget gameButtons() {
    return MaterialApp(
        home: Builder(
            builder: (context) =>
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      // ignore: prefer_const_constructors
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(250, 129, 00, 0.07),
                          fixedSize: const Size(450, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      icon: Icon(Icons.play_circle_outline_outlined,
                          color: Colors.red.shade900,
                          size: MediaQuery.of(context).size.width / 39),
                      label: Text(
                        'Новая игра',
                        style: TextStyle(
                            fontFamily: 'Optimus Princeps',
                            color: Colors.white70,
                            fontSize: MediaQuery.of(context).size.width / 38),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const MyGame());
                        Navigator.of(context).push(route);
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(450, 60),
                            primary: const Color.fromRGBO(250, 129, 00, 0.07),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        icon: Icon(Icons.play_circle_fill_outlined,
                            color: Colors.red.shade900,
                            size: MediaQuery.of(context).size.width / 39),
                        label: Text(
                          'Загрузка',
                          style: TextStyle(
                              fontFamily: 'Optimus Princeps',
                              color: Colors.white70,
                              fontSize: MediaQuery.of(context).size.width / 38),
                        ),
                        onPressed: () {
                          Route load = MaterialPageRoute(
                              builder: (context) => const LoadMyGame());
                          Navigator.of(context).push(load);
                        },
                      )),
                  Container(
                      margin: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(450, 60),
                            primary: const Color.fromRGBO(250, 129, 00, 0.07),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        icon: Icon(Icons.close,
                            color: Colors.red.shade900,
                            size: MediaQuery.of(context).size.width / 39),
                        label: Text(
                          'Выйти из игры',
                          style: TextStyle(
                              fontFamily: 'Optimus Princeps',
                              color: Colors.white70,
                              fontSize: MediaQuery.of(context).size.width / 38),
                        ),
                        onPressed: () {
                          exit(0);
                        },
                      ))
                ])));
  }

  Widget gameName() {
    return Builder(
        builder: (context) => Container(
              alignment: Alignment.topCenter,
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300.0,
                    maxWidth: 950.0,
                    minHeight: 30.0,
                    maxHeight: 200.0,
                  ),
                  child: AutoSizeText(
                    'Тени Хаоса',
                    style: TextStyle(
                        fontSize: 130,
                        fontFamily: 'Optimus Princeps',
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.w500),
                  )),
            ));
  }
}
