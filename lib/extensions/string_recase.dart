extension StringRecase on String {
  //Sentence case
  String get sentenceCase => this[0].toUpperCase() + substring(1);
}
