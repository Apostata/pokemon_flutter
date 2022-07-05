import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LittleRootWidget extends StatelessWidget {
  final double x;
  final double y;

  final String currentMap;

  const LittleRootWidget({
    required this.x,
    required this.y,
    required this.currentMap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Image.asset(
        '${kIsWeb ? "" : "assets/"}images/$currentMap.png',
        width: MediaQuery.of(context).size.width * 0.75, //0.75
        fit: BoxFit.cover,
      ),
    );
  }
}
