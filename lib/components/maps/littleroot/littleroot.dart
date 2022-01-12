import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_dart/components/maps/littleroot/blockedLitteRootpaths.dart';

class LittleRoot extends StatelessWidget {
  final double x;
  final double y;

  final String currentMap;
  static List<List<double>> blockedPath =
      BlockedLitteRoot.blockedLittleRootPaths;

  const LittleRoot(
      {required this.x, required this.y, required this.currentMap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'littleroot') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          '${kIsWeb ? "" : "assets/"}images/littleroot.png',
          width: MediaQuery.of(context).size.width * 0.75, //0.75
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
