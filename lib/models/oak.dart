class ProfOak {
  List<String> speaks = ['teste0', 'teste1', 'teste2'];
  late int speaksIdx;
  List<double> position = [0.125, 0.9];

  ProfOak() {
    speaksIdx = 0;
  }

  void talkTo() {
    if (speaksIdx > 2) {
      speaksIdx = 0;
    }
    print('${speaks[speaksIdx]}, idx:$speaksIdx');
    speaksIdx++;
  }
}
