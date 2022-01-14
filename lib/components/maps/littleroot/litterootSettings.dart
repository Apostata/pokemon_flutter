class LitteRootSettings {
  static List<double> initialPosition = [1.125, 0.65];
  static double step = 0.25;
  static double boyHeight = 20;
  static Map<String, List<List<dynamic>>> toAnotherMaps = {
    'pokelab': [
      [0.625, -1.35, 'Up']
    ],
  };
  static const List<List<double>> blockedPaths = [
    [0.125, 0.9], //profOak
    [0.125, 2.9],
    [0.125, 2.65],
    [0.375, 2.65],
    [0.625, 2.65],
    [0.875, 2.65],
    [1.125, 2.65],
    [1.375, 2.65],
    [1.625, 2.65],
    [1.875, 2.65],
    [2.125, 2.65],
    [2.625, 1.9],
    [2.625, 2.15],
    [2.375, 2.15],
    [2.125, 2.15],
    [2.125, 2.4],
    [2.625, 1.65],
    [2.625, 1.4],
    [2.625, 1.15],
    [2.625, 0.9],
    [2.625, 0.65],
    [2.625, 0.4],
    [2.625, 0.15],
    [2.625, -0.1],
    [2.625, -0.35],
    [2.625, -0.6],
    [2.625, -0.85],
    [2.625, -1.1],
    [2.625, -1.35],
    [2.625, -1.6],
    [2.375, -1.6],
    [2.125, -1.6],
    [2.125, -1.85],
    [2.125, -2.1],
    [1.875, -2.1],
    [1.625, -2.1],
    [1.375, -2.1],
    [1.125, -2.1],
    [0.875, -2.1],
    [0.625, -2.1],
    [0.375, -2.1],
    [0.125, -2.1],
    [-0.125, -2.1],
    [-0.375, -2.1],
    [-0.625, -2.1],
    [-0.875, -2.1],
    [-1.125, -2.1],
    [-1.375, -2.1],
    [-1.625, -2.1],
    [-0.875, -2.1],
    [-1.125, -2.1],
    [-1.375, -2.1],
    [-1.625, -2.1],
    [-1.875, -1.6],
    [-2.125, -1.6],
    [-2.375, -1.1],
    [-2.625, -1.1],
    [-2.625, -0.85],
    [-2.625, -0.6],
    [-2.625, -0.35],
    [-2.625, -0.1],
    [-2.625, 0.15],
    [-2.625, 0.4],
    [-2.625, 0.65],
    [-2.625, 0.9],
    [-2.625, 1.15],
    [-2.625, 1.4],
    [-2.625, 1.65],
    [-2.625, 1.9],
    [-2.625, 2.15],
    [-2.375, 2.15],
    [-2.125, 2.15],
    [-2.125, 2.4],
    [-2.125, 2.65],
    [-1.875, 2.65],
    [-1.625, 2.65],
    [-1.375, 2.65],
    [-1.125, 2.65],
    [-0.875, 2.65],
    [-0.625, 2.65],
    [-0.625, 0.9],
    [-0.875, 0.9],
    [-1.125, 0.9],
    [-1.375, 0.9],
    [-1.625, 0.9],
    [-1.875, 0.9],
    [-1.875, 1.15],
    [-1.625, 1.15],
    [-1.375, 1.15],
    [-1.125, 1.15],
    [-0.875, 1.15],
    [-1.875, 1.4],
    [-1.625, 1.4],
    [-1.375, 1.4],
    [-1.125, 1.4],
    [-0.875, 1.4],
    [-1.875, 1.65],
    [-1.625, 1.65],
    [-1.375, 1.65],
    [-1.125, 1.65],
    [-0.875, 1.65],
    [-1.875, 1.9],
    [-1.625, 1.9],
    [-1.375, 1.9],
    [-1.125, 1.9],
    [-0.875, 1.9],
    [0.625, 0.9],
    [0.875, 0.9],
    [1.125, 0.9],
    [1.375, 0.9],
    [1.625, 0.9],
    [1.875, 0.9],
    [0.875, 1.15],
    [1.125, 1.15],
    [1.375, 1.15],
    [1.625, 1.15],
    [1.875, 1.15],
    [0.875, 1.4],
    [1.125, 1.4],
    [1.375, 1.4],
    [1.625, 1.4],
    [1.875, 1.4],
    [0.875, 1.65],
    [1.125, 1.65],
    [1.375, 1.65],
    [1.625, 1.65],
    [1.875, 1.65],
    [0.875, 1.9],
    [1.125, 1.9],
    [1.375, 1.9],
    [1.625, 1.9],
    [1.875, 1.9],
    [1.625, -0.1],
    [1.375, -0.1],
    [1.125, -0.1],
    [0.875, -0.1],
    [0.625, -0.1],
    [0.375, -0.1],
    [0.125, -0.1],
    [1.625, -0.35],
    [1.375, -0.35],
    [1.125, -0.35],
    [0.875, -0.35],
    [0.625, -0.35],
    [0.375, -0.35],
    [0.125, -0.35],
    [1.625, -0.6],
    [1.375, -0.6],
    [1.125, -0.6],
    [0.875, -0.6],
    [0.625, -0.6],
    [0.375, -0.6],
    [0.125, -0.6],
    [1.625, -0.85],
    [1.375, -0.85],
    [1.125, -0.85],
    [0.875, -0.85],
    [0.625, -0.85],
    [0.375, -0.85],
    [0.125, -0.85],
    [1.625, -1.1],
    [1.375, -1.1],
    [1.125, -1.1],
    [0.875, -1.1],
    [0.375, -1.1],
    [0.125, -1.1],
    [0.875, -1.35],
    [-1.375, -0.35],
    [-1.625, -1.85],
    [-1.625, -1.6],
    [-2.125, -1.35],
    [-2.125, -1.1],
    [-0.625, 2.9],
    [-0.125, 3.15],
    [-0.375, 3.15]
  ];
}
