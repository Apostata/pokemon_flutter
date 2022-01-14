import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfOak extends StatelessWidget {
  final double x;
  final double y;
  final String direction;
  final String location;

  const ProfOak({
    Key? key,
    required this.direction,
    required this.location,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Image.asset(
        '${kIsWeb ? "" : "assets/"}images/profoak$direction.png',
        width: MediaQuery.of(context).size.width * 0.75, //0.75
        fit: BoxFit.cover,
      ),
    );
  }
}
