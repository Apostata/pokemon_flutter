import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final String direction;
  final int spriteCount;
  final String location;
  double height = 20;

  MyBoy({
    Key? key,
    required this.direction,
    required this.spriteCount,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Image.asset(
        '${kIsWeb ? "" : "assets/"}images/boy$direction$spriteCount.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
