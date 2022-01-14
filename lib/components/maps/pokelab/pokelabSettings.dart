//initialpost = [0, -2.73];
// ignore_for_file: equal_keys_in_map

class PokelabSettings {
  static List<double> initialPosition = [0, -2.55];
  static double step = 0.43;
  static double boyHeight = 30;
  static Map<String, List<List<double>>> toAnotherMaps = {
    'littleroot': [
      [0, -2.55],
      [-0.43, -2.55]
    ],
  };

  static List<List<double>> blockedPaths = [
//bottom
    [0 + (1 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 + (2 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 + (3 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (1 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (2 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (3 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
    [0 - (6 * PokelabSettings.step), -2.55 - 1 * PokelabSettings.step],
// top
    [0 + (0 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (1 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (2 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (3 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (1 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (2 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (3 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (6 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
// right
    // mesa, cadeira, computador, estante e vazo
    [0 - (6 * PokelabSettings.step), -2.55 + 1 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 1 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 + 2 * PokelabSettings.step],
    [0 - (6 * PokelabSettings.step), -2.55 + 3 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 3 * PokelabSettings.step],
    // incobadora e arquivo
    [0 - (6 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    // estante e caixas e livros
    [0 - (4 * PokelabSettings.step), -2.55 + 8 * PokelabSettings.step],
    [0 - (3 * PokelabSettings.step), -2.55 + 8 * PokelabSettings.step],
    [0 - (6 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 - (4 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 - (3 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 - (6 * PokelabSettings.step), -2.55 + 10 * PokelabSettings.step],
    [0 - (5 * PokelabSettings.step), -2.55 + 10 * PokelabSettings.step],
    // parede
    [0 - (7 * PokelabSettings.step), -2.55 + 0 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 4 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 7 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 8 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 10 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 - (7 * PokelabSettings.step), -2.55 + 12 * PokelabSettings.step],

// left
    // vaso
    [0 + (3 * PokelabSettings.step), -2.55 + 0 * PokelabSettings.step],
    // mesa, cadeira, computador e estante
    [0 + (6 * PokelabSettings.step), -2.55 + 1 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 1 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 + 2 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 2 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 2 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 3 * PokelabSettings.step],
    // livros
    [0 + (6 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 + (3 * PokelabSettings.step), -2.55 + 5 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 + (3 * PokelabSettings.step), -2.55 + 6 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 + 7 * PokelabSettings.step],
    [0 + (5 * PokelabSettings.step), -2.55 + 7 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 7 * PokelabSettings.step],
    [0 + (3 * PokelabSettings.step), -2.55 + 7 * PokelabSettings.step],
    // caixas
    [0 + (6 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 + (2 * PokelabSettings.step), -2.55 + 9 * PokelabSettings.step],
    [0 + (6 * PokelabSettings.step), -2.55 + 10 * PokelabSettings.step],
    [0 + (4 * PokelabSettings.step), -2.55 + 10 * PokelabSettings.step],
    // vaso
    // parede
    [0 + (7 * PokelabSettings.step), -2.55 + 0 * PokelabSettings.step],
    [0 + (7 * PokelabSettings.step), -2.55 + 3 * PokelabSettings.step],
    [0 + (7 * PokelabSettings.step), -2.55 + 4 * PokelabSettings.step],
    [0 + (7 * PokelabSettings.step), -2.55 + 8 * PokelabSettings.step],
    [0 + (7 * PokelabSettings.step), -2.55 + 11 * PokelabSettings.step],
    [0 + (7 * PokelabSettings.step), -2.55 + 12 * PokelabSettings.step],
  ];
}
