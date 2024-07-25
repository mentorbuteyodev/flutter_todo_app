extension CustomizeExtensions on String {
  // sentence capitalize
  String capitalizeSentence() {
    // create a list of words
    List<String> wordList = split(' ');
    // remove empty words
    wordList.removeWhere((word) => word.isEmpty);

    // for loop to capitalize
    // the first letter of each word
    List<String> capitalizedWordList = wordList.map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).toList();

    return capitalizedWordList.join(' ');
  }
}
