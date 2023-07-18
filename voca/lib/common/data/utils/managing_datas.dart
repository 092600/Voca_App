import 'dart:math';

import 'package:voca/common/data/model/word/word.dart';

List<Word> setShuffling(Set<Word> words) {
  List<Word> randomizedAnswers = words.toList();
  randomizedAnswers.shuffle(Random());

  return randomizedAnswers;
}
