import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Keyboard extends StatefulWidget {
  final void Function() moveUp;
  final void Function() moveDown;
  final void Function() moveLeft;
  final void Function() moveRight;
  final void Function() pressedA;
  final void Function() pressedB;
  final Widget child;

  const Keyboard({
    Key? key,
    required this.moveUp,
    required this.moveDown,
    required this.moveLeft,
    required this.moveRight,
    required this.pressedA,
    required this.pressedB,
    required this.child,
  }) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  FocusNode focusNode = FocusNode();
  Timer? keyboardTimer;
  bool keyPressed = false;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      // keyBoard com mesmo delay do HoldDetector do Botão
      onKey: (RawKeyEvent event) {
        final isKeyDown = event is RawKeyDownEvent;
        if (keyPressed) {
          keyboardTimer?.cancel();
        } else {
          keyPressed = true;
          Timer(const Duration(milliseconds: 100), () {
            if (event.logicalKey == LogicalKeyboardKey.keyA && isKeyDown) {
              widget.moveLeft();
            } else if (event.logicalKey == LogicalKeyboardKey.keyD &&
                isKeyDown) {
              widget.moveRight();
            } else if (event.logicalKey == LogicalKeyboardKey.keyW &&
                isKeyDown) {
              widget.moveUp();
            } else if (event.logicalKey == LogicalKeyboardKey.keyS &&
                isKeyDown) {
              widget.moveDown();
            }
            keyPressed = false;
          });
        }
      },
      focusNode: focusNode,
      autofocus: true,
      child: widget.child,
    );
  }
}
