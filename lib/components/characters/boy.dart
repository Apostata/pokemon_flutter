import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final String direction;
  final int spriteCount;
  final String location;
  final double height;

  const MyBoy({
    Key? key,
    required this.direction,
    required this.spriteCount,
    required this.location,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(
        '${kIsWeb ? "" : "assets/"}images/boy$direction$spriteCount.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
