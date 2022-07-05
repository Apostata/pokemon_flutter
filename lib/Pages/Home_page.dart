import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:pokemon_dart/components/characters/boy.dart';
import 'package:pokemon_dart/components/characters/oak.dart';
import 'package:pokemon_dart/components/joypad.dart';
import 'package:pokemon_dart/components/keyboard.dart';
import 'package:pokemon_dart/components/maps/littlerootWidget.dart';
import 'package:pokemon_dart/components/maps/mapWidget.dart';
import 'package:pokemon_dart/components/maps/pokelab.dart';
import 'package:pokemon_dart/models/Littleroot.dart';
import 'package:pokemon_dart/models/Pokelab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int boySpriteCount = 0;
  int boyIndex = 2;
  String boyDirection = 'Down';
  String currentLocation = 'littleroot';

  late double mapX;
  late double mapY;
  late List<List<double>> blockedPaths;
  late Map<String, List<List<dynamic>>> toOtherMaps;
  late List<List<double>> changeboyIndex;
  late List<List<dynamic>> actions;
  late double step;
  late double boyHeight;

  String oakDirection = 'Down';
  double oakX = 0.125;
  double oakY = 0.9;
  int countPressingA = -1;

  bool canAction = false;
  // ignore: prefer_function_declarations_over_variables
  late void Function() actionFunction;

  @override
  void initState() {
    final map = Littleroot();
    setState(() {
      step = map.step;
      mapX = map.initialPosition[0];
      mapY = map.initialPosition[1];
      blockedPaths = map.blockedPaths;
      toOtherMaps = map.toAnotherMaps;
      changeboyIndex = map.behindSomething;
      boyHeight = map.boyHeight;
      actions = map.actions;
    });
    super.initState();
  }

  void _animateWalk() async {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double cleanNum(double num) {
    return double.parse(num.toStringAsFixed(4));
  }

  void _changeBoyIndex(x, y) {
    changeboyIndex.forEach((coordinates) {
      bool isSamePosition =
          x == cleanNum(coordinates[0]) && y == cleanNum(coordinates[1]);
      setState(() {
        boyIndex = isSamePosition ? 1 : 2;
      });
    });
  }

  void changeMap() {
    toOtherMaps.forEach((location, paths) {
      paths.forEach((coordinates) {
        if (mapX == coordinates[0] && mapY == coordinates[1]) {
          switch (location) {
            case 'pokelab':
              final lab = Pokelab();
              if (boyDirection == coordinates[2]) {
                setState(() {
                  currentLocation = location;
                  step = lab.step;
                  mapX = lab.initialPosition[0];
                  mapY = lab.initialPosition[1];
                  blockedPaths = lab.blockedPaths;
                  toOtherMaps = lab.toAnotherMaps;
                  changeboyIndex = lab.behindSomething;
                  boyHeight = lab.boyHeight;
                  actions = lab.actions;
                });
              }
              break;
            case 'littleroot':
              final ltr = Littleroot();
              if (boyDirection == coordinates[2]) {
                setState(() {
                  currentLocation = location;
                  step = ltr.step;
                  mapX = 0.625;
                  mapY = -1.35;
                  blockedPaths = ltr.blockedPaths;
                  toOtherMaps = ltr.toAnotherMaps;
                  changeboyIndex = ltr.behindSomething;
                  boyHeight = ltr.boyHeight;
                  actions = ltr.actions;
                });
              }
              break;
          }
        }
      });
    });
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  bool canSolveAnAction(x, y, direction) {
    bool canAction = false;
    actions.forEach((action) {
      if (x == cleanNum(action[0]) &&
          y == cleanNum(action[1]) &&
          direction == action[2]) {
        action[3]();
        setState(() {
          actionFunction = action[3];
        });
        canAction = true;
      }
    });
    return canAction;
  }

  bool canMoveTo() {
    double stepX = 0;
    double stepY = 0;

    if (boyDirection == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (boyDirection == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (boyDirection == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (boyDirection == 'Down') {
      stepX = 0;
      stepY = -step;
    }

    for (List<double> path in blockedPaths) {
      if ((cleanNum(path[0]) == cleanNum(mapX + stepX)) &&
          (cleanNum(path[1]) == cleanNum(mapY + stepY))) {
        return false;
      }
    }
    return true;
  }

  void moveUp() {
    boyDirection = 'Up';
    bool canMove = canMoveTo();
    if (canMove) {
      setState(() {
        mapY = cleanNum(mapY + step);
      });
    }
    changeMap();
    // canSolveAnAction(mapX, mapY, 'Up');
    _animateWalk();
    _changeBoyIndex(mapX, mapY);
  }

  void moveDown() {
    boyDirection = 'Down';
    bool canMove = canMoveTo();

    if (canMove) {
      setState(() {
        mapY = cleanNum(mapY - step);
      });
    }
    changeMap();
    // canSolveAnAction(mapX, mapY, 'Down');
    _animateWalk();
    _changeBoyIndex(mapX, mapY);
  }

  void moveLeft() {
    boyDirection = 'Left';
    bool canMove = canMoveTo();

    if (canMove) {
      setState(() {
        mapX = cleanNum(mapX + step);
      });
    }
    changeMap();
    // canSolveAnAction(mapX, mapY, 'Left');
    _animateWalk();
    _changeBoyIndex(mapX, mapY);
  }

  void moveRight() {
    boyDirection = 'Right';
    bool canMove = canMoveTo();

    if (canMove) {
      setState(() {
        mapX = cleanNum(mapX - step);
      });
    }
    _animateWalk();
    changeMap();
    // canSolveAnAction(mapX, mapY, 'Right');
    _changeBoyIndex(mapX, mapY);
  }

  void pressedA() {
    if (canSolveAnAction(mapX, mapY, boyDirection)) {
      actionFunction();
    }
  }

  void pressedB() {}

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Keyboard(
        moveUp: moveUp,
        moveDown: moveDown,
        moveLeft: moveLeft,
        moveRight: moveRight,
        pressedA: pressedA,
        pressedB: pressedB,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.black,
                child: Indexer(children: [
                  MapWidget(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                  ),
                  if (currentLocation == 'littleroot')
                    Indexed(
                      index: 2,
                      child: Container(
                        child: ProfOakWidget(
                          x: mapX,
                          y: mapY,
                          direction: oakDirection,
                          location: currentLocation,
                        ),
                        alignment: const Alignment(0, 0),
                      ),
                    ),
                  Indexed(
                    index: boyIndex,
                    child: Container(
                      child: MyBoy(
                        height: boyHeight,
                        direction: boyDirection,
                        spriteCount: boySpriteCount,
                        location: currentLocation,
                      ),
                      alignment: const Alignment(0, 0),
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'G A M E B O Y',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          Text(
                            'F L U T T E R',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Joypad(
                            moveUp: moveUp,
                            moveDown: moveDown,
                            moveLeft: moveLeft,
                            moveRight: moveRight,
                            pressedA: pressedA,
                            pressedB: pressedB,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
