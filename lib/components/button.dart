import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';

class Button extends StatelessWidget {
  final void Function() function;
  final dynamic textOrIcon;

  const Button({
    Key? key,
    required this.function,
    required this.textOrIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      onHold: () => function(),
      holdTimeout: const Duration(milliseconds: 100),
      onTap: () => function(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.white),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: textOrIcon is IconData
                ? Icon(
                    textOrIcon,
                    color: Colors.white,
                  )
                : Text(
                    textOrIcon,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
          ),
        ),
      ),
    );
  }
}
