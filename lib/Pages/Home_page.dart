import 'dart:async';
import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_dart/components/characters/boy.dart';
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

  int boySpriteCount = 0;
  String boyDirection = 'Down';
  double step = LitteRootSettings.step;
  double boyHeight = LitteRootSettings.boyHeight;

  String currentLocation = 'littleroot';
  List<List<double>> blockedPaths = LitteRootSettings.blockedPaths;
  Map<String, List<List<double>>> toOtherMaps = LitteRootSettings.toAnotherMaps;

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

  bool changeMap() {
    toOtherMaps.forEach((location, paths) {
      paths.forEach((coordinates) {
        if (mapX == coordinates[0] && mapY == coordinates[1]) {
          switch (location) {
            case 'pokelab':
              setState(() {
                boyHeight = PokelabSettings.boyHeight;
                step = PokelabSettings.step;
                toOtherMaps = PokelabSettings.toAnotherMaps;
                blockedPaths = PokelabSettings.blockedPaths;
                mapX = PokelabSettings.initialPosition[0];
                mapY = PokelabSettings.initialPosition[1];
                currentLocation = location;
              });
              break;
            default:
              setState(() {
                boyHeight = LitteRootSettings.boyHeight;
                step = LitteRootSettings.step;
                toOtherMaps = LitteRootSettings.toAnotherMaps;
                blockedPaths = LitteRootSettings.blockedPaths;
                mapX = 0.625;
                mapY = -1.35;
                currentLocation = location;
              });
              break;
          }
        }
      });
    });
    return true;
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
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
    changeMap();
    if (canMoveTo()) {
      setState(() {
        mapY = cleanNum(mapY + step);
      });
    }
    _animateWalk();
  }

  void moveDown() {
    changeMap();
    boyDirection = 'Down';
    if (canMoveTo()) {
      setState(() {
        mapY = cleanNum(mapY - step);
      });
    }
    _animateWalk();
  }

  void moveLeft() {
    changeMap();
    boyDirection = 'Left';
    if (canMoveTo()) {
      setState(() {
        mapX = cleanNum(mapX + step);
      });
    }
    _animateWalk();
  }

  void moveRight() {
    changeMap();
    boyDirection = 'Right';
    if (canMoveTo()) {
      setState(() {
        mapX = cleanNum(mapX - step);
      });
    }
    _animateWalk();
  }

  void pressedA() {}
  void pressedB() {}

  @override
  Widget build(BuildContext context) {
    // print('X:${mapX}, Y:${mapY}');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(children: [
                //littelroot
                LittleRoot(
                  x: mapX,
                  y: mapY,
                  currentMap: currentLocation,
                ),
                Pokelab(
                  x: mapX,
                  y: mapY,
                  currentMap: currentLocation,
                ),
                Container(
                  child: MyBoy(
                    height: boyHeight,
                    direction: boyDirection,
                    spriteCount: boySpriteCount,
                    location: currentLocation,
                  ),
                  alignment: const Alignment(0, 0),
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
    );
  }
}
