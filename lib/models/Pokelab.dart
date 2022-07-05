class Pokelab {
  final List<double> initialPosition = [0, -2.55];
  final double step = 0.43;
  final double boyHeight = 30;
  final Map<String, List<List<dynamic>>> toAnotherMaps = {
    'littleroot': [
      [0, -2.55, 'Down'],
      [-0.43, -2.55, 'Down']
    ],
  };

  late List<List<dynamic>> actions = [];
  late List<List<double>> blockedPaths;

  List<List<double>> behindSomething = [];

  Pokelab() {
    blockedPaths = [
//bottom
      [0 + (0 * step), -2.55 - 1 * step],
      [0 + (1 * step), -2.55 - 1 * step],
      [0 + (2 * step), -2.55 - 1 * step],
      [0 + (3 * step), -2.55 - 1 * step],
      [0 + (4 * step), -2.55 - 1 * step],
      [0 + (5 * step), -2.55 - 1 * step],
      [0 + (6 * step), -2.55 - 1 * step],
      [0 - (1 * step), -2.55 - 1 * step],
      [0 - (2 * step), -2.55 - 1 * step],
      [0 - (3 * step), -2.55 - 1 * step],
      [0 - (4 * step), -2.55 - 1 * step],
      [0 - (5 * step), -2.55 - 1 * step],
      [0 - (6 * step), -2.55 - 1 * step],
// top
      [0 + (0 * step), -2.55 + 11 * step],
      [0 + (1 * step), -2.55 + 11 * step],
      [0 + (2 * step), -2.55 + 11 * step],
      [0 + (3 * step), -2.55 + 11 * step],
      [0 + (4 * step), -2.55 + 11 * step],
      [0 + (5 * step), -2.55 + 11 * step],
      [0 + (6 * step), -2.55 + 11 * step],
      [0 - (1 * step), -2.55 + 11 * step],
      [0 - (2 * step), -2.55 + 11 * step],
      [0 - (3 * step), -2.55 + 11 * step],
      [0 - (4 * step), -2.55 + 11 * step],
      [0 - (5 * step), -2.55 + 11 * step],
      [0 - (6 * step), -2.55 + 11 * step],
// right
      // mesa, cadeira, computador, estante e vazo
      [0 - (6 * step), -2.55 + 1 * step],
      [0 - (5 * step), -2.55 + 1 * step],
      [0 - (4 * step), -2.55 + 2 * step],
      [0 - (6 * step), -2.55 + 3 * step],
      [0 - (5 * step), -2.55 + 3 * step],
      // incobadora e arquivo
      [0 - (6 * step), -2.55 + 5 * step],
      [0 - (5 * step), -2.55 + 5 * step],
      [0 - (4 * step), -2.55 + 5 * step],
      [0 - (5 * step), -2.55 + 6 * step],
      [0 - (4 * step), -2.55 + 6 * step],
      // estante e caixas e livros
      [0 - (4 * step), -2.55 + 8 * step],
      [0 - (3 * step), -2.55 + 8 * step],
      [0 - (6 * step), -2.55 + 9 * step],
      [0 - (4 * step), -2.55 + 9 * step],
      [0 - (3 * step), -2.55 + 9 * step],
      [0 - (6 * step), -2.55 + 10 * step],
      [0 - (5 * step), -2.55 + 10 * step],
      // parede
      [0 - (7 * step), -2.55 + 0 * step],
      [0 - (7 * step), -2.55 + 4 * step],
      [0 - (7 * step), -2.55 + 6 * step],
      [0 - (7 * step), -2.55 + 7 * step],
      [0 - (7 * step), -2.55 + 8 * step],
      [0 - (7 * step), -2.55 + 9 * step],
      [0 - (7 * step), -2.55 + 10 * step],
      [0 - (7 * step), -2.55 + 11 * step],
      [0 - (7 * step), -2.55 + 12 * step],

// left
      // vaso
      [0 + (3 * step), -2.55 + 0 * step],
      // mesa, cadeira, computador e estante
      [0 + (6 * step), -2.55 + 1 * step],
      [0 + (5 * step), -2.55 + 1 * step],
      [0 + (6 * step), -2.55 + 2 * step],
      [0 + (5 * step), -2.55 + 2 * step],
      [0 + (4 * step), -2.55 + 2 * step],
      [0 + (5 * step), -2.55 + 3 * step],
      // livros
      [0 + (6 * step), -2.55 + 5 * step],
      [0 + (5 * step), -2.55 + 5 * step],
      [0 + (4 * step), -2.55 + 5 * step],
      [0 + (3 * step), -2.55 + 5 * step],
      [0 + (6 * step), -2.55 + 6 * step],
      [0 + (5 * step), -2.55 + 6 * step],
      [0 + (4 * step), -2.55 + 6 * step],
      [0 + (3 * step), -2.55 + 6 * step],
      [0 + (6 * step), -2.55 + 7 * step],
      [0 + (5 * step), -2.55 + 7 * step],
      [0 + (4 * step), -2.55 + 7 * step],
      [0 + (3 * step), -2.55 + 7 * step],
      // caixas
      [0 + (6 * step), -2.55 + 9 * step],
      [0 + (2 * step), -2.55 + 9 * step],
      [0 + (6 * step), -2.55 + 10 * step],
      [0 + (4 * step), -2.55 + 10 * step],
      // vaso
      // parede
      [0 + (7 * step), -2.55 + 0 * step],
      [0 + (7 * step), -2.55 + 3 * step],
      [0 + (7 * step), -2.55 + 4 * step],
      [0 + (7 * step), -2.55 + 8 * step],
      [0 + (7 * step), -2.55 + 11 * step],
      [0 + (7 * step), -2.55 + 12 * step],
    ];
  }
}
