import 'package:flutter/material.dart';
import 'package:pokemon_dart/components/button.dart';

class Joypad extends StatelessWidget {
  final void Function() moveUp;
  final void Function() moveDown;
  final void Function() moveLeft;
  final void Function() moveRight;
  final void Function() pressedA;
  final void Function() pressedB;

  const Joypad(
      {Key? key,
      required this.moveUp,
      required this.moveDown,
      required this.moveLeft,
      required this.moveRight,
      required this.pressedA,
      required this.pressedB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Button(
                  function: moveLeft,
                  textOrIcon: Icons.arrow_back,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Column(
              children: [
                Button(
                  function: moveUp,
                  textOrIcon: Icons.arrow_upward,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Button(
                  function: moveDown,
                  textOrIcon: Icons.arrow_downward,
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Button(
                  function: moveRight,
                  textOrIcon: Icons.arrow_forward,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                  width: 50,
                ),
                Button(
                  function: moveUp,
                  textOrIcon: 'a',
                ),
              ],
            ),
            Column(
              children: [
                Button(
                  function: moveUp,
                  textOrIcon: 'b',
                ),
                const SizedBox(
                  height: 30,
                  width: 50,
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
