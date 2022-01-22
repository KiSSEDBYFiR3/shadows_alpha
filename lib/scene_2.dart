import 'dart:convert';
import 'dart:io';
import 'package:alpha_02/scene_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextScene extends StatefulWidget {
  const NextScene({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NextSceneState();
}

int cardNum = 0;
int msgNum = 0;
int lastId = 0;
String jsonScene = "scene_2.json";
String currentCharacter = "";
String currentMessage = "";
var currentCharacterImage = "";
var currentScenary = "";
List choisesList = [];

class NextSceneState extends State<NextScene> {
  Map data = {};
//внутрененее состояние класса незменяемое при каждом изменении основного состоянии программы
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<File> _setSaveData() async {
    final file = File('assets/saves.json');
    Map<String, dynamic> content = {
      "currentSceneJson": jsonScene,
      "currentNum": cardNum
    };
    return file.writeAsString(json.encode(content));
  }

//конструктор, получающий данные из json файла
  Future<void> fetchData() async {
    final response =
        await rootBundle.loadString('assets/jsonFiles/' + jsonScene);
    setState(() {
      data = jsonDecode(response);
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
      choisesList = data['cards'][cardNum]['choises'].toList();
      lastId = data['cards'][cardNum]['id'];
    });
  }

// функция создающая диалоговые окна
  _openDialogue(BuildContext context) async {
    switch (await showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: const Color.fromRGBO(244, 244, 244, 0.03),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(12),
                onPressed: () {
                  Navigator.pop(context, "Option 1");
                },
                child: Center(
                    child: Text(
                        data["cards"][cardNum]["choises"][0]['optionText'],
                        style: const TextStyle(
                            color: Color.fromRGBO(247, 208, 84, 0.85),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Optimus Princeps',
                            fontSize: 23))),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(12),
                onPressed: () {
                  Navigator.pop(context, "Option 2");
                },
                child: Center(
                    child: Text(
                        data["cards"][cardNum]["choises"][1]['optionText'],
                        style: const TextStyle(
                            color: Color.fromRGBO(247, 208, 84, 0.85),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Optimus Princeps',
                            fontSize: 23))),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(12),
                onPressed: () {
                  Navigator.pop(context, "Option 3");
                },
                child: Center(
                    child: Text(
                        data["cards"][cardNum]["choises"][2]['optionText'],
                        style: const TextStyle(
                            color: Color.fromRGBO(247, 208, 84, 0.85),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Optimus Princeps',
                            fontSize: 23))),
              )
            ],
          );
        })) {
      case "Option 1":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][0]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
      case "Option 2":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][1]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
      case "Option 3":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][2]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
    }
  }

  void lastCardNum() {
    setState(() {
      cardNum = lastId - 1;
      lastId = data['cards'][cardNum]['id'];
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

//функция изменяющая состояние виджета и переопределяющая переменные
  void nextCardNum() {
    setState(() {
      if (msgNum == data['cards'][cardNum]['dialogueMessage'].length - 1) {
        msgNum = 0;
        cardNum++;
      } else {
        msgNum++;
      }
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
      lastId = data['cards'][cardNum]['id'];
    });
  }

  @override
  //создаем стэк, в который передаем остальные виджеты для вывода на экран
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Stack(
          children: [
            backgroundScenary(),
            currentCharacter == " "
                ? noCharacterShadow()
                : currentCharacterWidget(),
            dialogueWindow(),
            textMessage(),
            characterName(),
            nextButton(),
          ],
        ),
      )),
    );
  }

  Widget backgroundScenary() {
    return Center(
      child: Image.asset(currentScenary),
      widthFactor: 1.2,
    );
  }

// прозрачная тень, отображаемая в моменты повествования без участвия разговоров персонажей
  Widget noCharacterShadow() {
    return Container(
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.only(bottom: 20),
        child: Image.asset("assets/shadow.png"));
  }

// виджет выводящий диалоговое окно
  Widget dialogueWindow() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 30),
      alignment: Alignment.bottomLeft,
      child: Image.asset('assets/dialogue-box.png'),
    );
  }

// виджет выводящий текущий текст диалога
  Widget textMessage() {
    return Container(
      width: 1200,
      margin: EdgeInsets.only(
          left: 50,
          right: 30,
          bottom: 100,
          top: MediaQuery.of(context).size.height / 1.28),
      alignment: Alignment.topLeft,
      child: Text(
        currentMessage,
        textAlign: TextAlign.left,
        textScaleFactor: 1.5,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Optimus Princeps', fontSize: 16),
      ),
    );
  }

// виджет выводящий в диалоговое окно имя персонажа
  Widget characterName() {
    return Container(
      margin: const EdgeInsets.only(left: 45, bottom: 250),
      alignment: Alignment.bottomLeft,
      child: Text(
        currentCharacter,
        textAlign: TextAlign.left,
        textScaleFactor: 2.2,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Optimus Princeps', fontSize: 15),
      ),
    );
  }

// виджет  выводящий на экран изображение персонажа
  Widget currentCharacterWidget() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.asset(currentCharacterImage),
    );
  }

// виджет-конпка 'далее', которая задействует функцию nextCardNum, которая обновляет переменные и состояние основного виджета
  Widget nextButton() {
    return MaterialApp(
        home: Builder(
            builder: (context) => Row(children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 360, bottom: 260),
                      child: IconButton(
                          icon: Icon(
                            Icons.save_alt,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 40,
                          ),
                          onPressed: () {
                            _setSaveData();
                          })),
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 40, bottom: 260),
                      child: IconButton(
                          icon: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 35,
                          ),
                          onPressed: () {
                            data['cards'][cardNum]['choises'].isEmpty
                                ? lastCardNum()
                                : _openDialogue(context);
                          })),
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 40, bottom: 260),
                      child: IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 35,
                        ),
                        onPressed: () {
                          if (cardNum != data['cards'].length - 1) {
                            data['cards'][cardNum]['choises'].isEmpty
                                ? nextCardNum()
                                : _openDialogue(context);
                          } else {
                            Route route = MaterialPageRoute(
                                builder: (context) => const LastScene());
                            Navigator.push(context, route);
                          }
                        },
                      )),
                ])));
  }
}
