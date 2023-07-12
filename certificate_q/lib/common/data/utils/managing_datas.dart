import 'dart:math';

import 'package:certificate_q/common/data/model/word/word.dart';

List<Word> setShuffling(Set<Word> words) {
  List<Word> randomizedAnswers = words.toList();
  randomizedAnswers.shuffle(Random());

  return randomizedAnswers;
}
