import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_dart/components/characters/boy.dart';
import 'package:pokemon_dart/components/joypad.dart';
import 'package:pokemon_dart/components/maps/littleroot/littleroot.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 1.125;
  double mapY = 0.65;

  int boySpriteCount = 0;
  String boyDirection = 'Down';
  double step = 0.25;

  String currentLocation = 'littleroot';
  List<List<double>> blockedPaths = LittleRoot.blockedPath;

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
    if (canMoveTo()) {
      setState(() {
        mapY += step;
      });
    }
    _animateWalk();
  }

  void moveDown() {
    boyDirection = 'Down';
    if (canMoveTo()) {
      setState(() {
        mapY -= step;
      });
    }
    _animateWalk();
  }

  void moveLeft() {
    boyDirection = 'Left';
    if (canMoveTo()) {
      setState(() {
        mapX += step;
      });
    }
    _animateWalk();
  }

  void moveRight() {
    boyDirection = 'Right';
    if (canMoveTo()) {
      setState(() {
        mapX -= step;
      });
    }
    _animateWalk();
  }

  void pressedA() {}
  void pressedB() {}

  @override
  Widget build(BuildContext context) {
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
                Container(
                  child: MyBoy(
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
