import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indexed/indexed.dart';
import 'package:pokemon_dart/components/characters/boy.dart';
import 'package:pokemon_dart/components/characters/oak.dart';
import 'package:pokemon_dart/components/joypad.dart';
import 'package:pokemon_dart/components/maps/littleroot/litterootSettings.dart';
import 'package:pokemon_dart/components/maps/littleroot/littleroot.dart';
import 'package:pokemon_dart/components/maps/pokelab/pokelab.dart';
import 'package:pokemon_dart/components/maps/pokelab/pokelabSettings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = LitteRootSettings.initialPosition[0];
  double mapY = LitteRootSettings.initialPosition[1];

  Timer? keyboardTimer;
  bool keyPressed = false;

  int boySpriteCount = 0;
  String boyDirection = 'Down';
  double step = LitteRootSettings.step;
  double boyHeight = LitteRootSettings.boyHeight;
  int boyIndex = 2;

  String oakDirection = 'Down';
  double oakX = 0.125;
  double oakY = 0.9;
  int countPressingA = -1;

  String currentLocation = 'littleroot';
  List<List<double>> blockedPaths = LitteRootSettings.blockedPaths;
  Map<String, List<List<dynamic>>> toOtherMaps =
      LitteRootSettings.toAnotherMaps;
  List<List<double>> changeboyIndex = LitteRootSettings.behindSomething;
  List<List<dynamic>> actions = LitteRootSettings.actions;

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
              if (boyDirection == coordinates[2]) {
                setState(() {
                  boyHeight = PokelabSettings.boyHeight;
                  step = PokelabSettings.step;
                  toOtherMaps = PokelabSettings.toAnotherMaps;
                  blockedPaths = PokelabSettings.blockedPaths;
                  mapX = PokelabSettings.initialPosition[0];
                  mapY = PokelabSettings.initialPosition[1];
                  currentLocation = location;
                });
              }
              break;
            default:
              if (boyDirection == coordinates[2]) {
                setState(() {
                  boyHeight = LitteRootSettings.boyHeight;
                  step = LitteRootSettings.step;
                  toOtherMaps = LitteRootSettings.toAnotherMaps;
                  blockedPaths = LitteRootSettings.blockedPaths;
                  mapX = 0.625;
                  mapY = -1.35;
                  currentLocation = location;
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

  void canSolveAnAction(x, y, direction) {
    actions.forEach((action) {
      if (x == cleanNum(action[0]) &&
          y == cleanNum(action[1]) &&
          direction == action[2]) {
        print(
            'action MapX:${cleanNum(action[0])}, MapY:${cleanNum(action[1])}');
      }
    });
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
    canSolveAnAction(mapX, mapY, 'Up');
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
    canSolveAnAction(mapX, mapY, 'Down');
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
    canSolveAnAction(mapX, mapY, 'Left');
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
    canSolveAnAction(mapX, mapY, 'Right');
    _changeBoyIndex(mapX, mapY);
  }

  void pressedA() {}
  void pressedB() {}

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
        // keyBoard com mesmo delay do HoldDetector do Botão
        onKey: (RawKeyEvent event) {
          final isKeyDown = event is RawKeyDownEvent;
          if (keyPressed) {
            keyboardTimer?.cancel();
          } else {
            keyPressed = true;
            Timer(const Duration(milliseconds: 100), () {
              if (event.logicalKey == LogicalKeyboardKey.keyA && isKeyDown) {
                boyDirection = 'Left';
                moveLeft();
              } else if (event.logicalKey == LogicalKeyboardKey.keyD &&
                  isKeyDown) {
                boyDirection = 'Right';
                moveRight();
              } else if (event.logicalKey == LogicalKeyboardKey.keyW &&
                  isKeyDown) {
                boyDirection = 'Up';
                moveUp();
              } else if (event.logicalKey == LogicalKeyboardKey.keyS &&
                  isKeyDown) {
                boyDirection = 'Down';
                moveDown();
              }
              keyPressed = false;
            });
          }
        },
        focusNode: focusNode,
        autofocus: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.black,
                child: Indexer(children: [
                  if (currentLocation == 'littleroot')
                    LittleRoot(
                      x: mapX,
                      y: mapY,
                      currentMap: currentLocation,
                    ),
                  if (currentLocation == 'littleroot')
                    Indexed(
                      index: 2,
                      child: Container(
                        child: ProfOak(
                          x: mapX,
                          y: mapY,
                          direction: oakDirection,
                          location: currentLocation,
                        ),
                        alignment: const Alignment(0, 0),
                      ),
                    ),
                  if (currentLocation == 'pokelab')
                    Pokelab(
                      x: mapX,
                      y: mapY,
                      currentMap: currentLocation,
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
                              pressedB: pressedB),
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
