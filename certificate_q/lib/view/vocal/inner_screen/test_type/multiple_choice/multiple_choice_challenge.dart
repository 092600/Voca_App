import 'dart:math';

import 'package:certificate_q/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/component/custom_app_bar.dart';
import '../../../../../common/const/app_colors.dart';
import '../../../../../common/data/model/word/word.dart';
import '../../../../../common/data/utils/managing_datas.dart';
import '../../../../../common/data/model/word/type/language_type.dart';
import '../../vocal_words_detail_screen.dart';
import 'component/test_choice_container.dart';

class MultipleChoiceChallengeScreen extends StatefulWidget {
  final LanguageType languageType;
  final List<Word> questions;

  const MultipleChoiceChallengeScreen({
    required this.languageType,
    required this.questions,
    super.key,
  });

  @override
  State<MultipleChoiceChallengeScreen> createState() =>
      _MultipleChoiceChallengeScreenState();
}

class _MultipleChoiceChallengeScreenState
    extends State<MultipleChoiceChallengeScreen> {
  int questionIndex = 0;
  bool isLoaded = false;

  int correct = 0;
  int nonCorrect = 0;

  late Word question;

  List<Word> incorrectWords = [];

  @override
  Widget build(BuildContext context) {
    final List<Word> questions = widget.questions;

    // 처음에 들어온 경우, words -> shuffle
    if (!isLoaded) {
      questions.shuffle(Random());
    }

    question = questions[questionIndex];

    void answerClickedEvent(bool isAnswer, Word word) {
      setState(() {
        isLoaded = true;

        if ((correct + nonCorrect) != questions.length - 1) {
          if (isAnswer) {
            correct++;
          } else {
            nonCorrect++;
            incorrectWords.add(word);
          }

          questionIndex++;
        } else {
          if (isAnswer) {
            correct++;
          } else {
            nonCorrect++;
            incorrectWords.add(word);
          }

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: <Widget>[
                  Text(
                    "단어 시험 종료 !",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$correct / ${questions.length}\n",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeLayout(),
                        ), (route) {
                      return route == "/home";
                    });
                  },
                  child: Text(
                    "돌아기기",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VocalWordsDetailsScreen(
                          incorrectWords: incorrectWords,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "틀린 문제 확인하기",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "사지선다",
            expandedHeight: kToolbarHeight + 20,
            appBarBody: MultipleChoiceChallengeAppBarBody(),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "정답 : $correct",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 15,
                      ),
                      Text(
                        "오답 : $nonCorrect",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                QuestionContainer(
                  question: question,
                ),
                AnswerContainer(
                  question: question,
                  answers: getAnswersForQuestion(questions, questionIndex),
                  answerClickedEvent: answerClickedEvent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Word> getAnswersForQuestion(List<Word> words, int currentQuestionIndex) {
    Set<Word> answers = {words[currentQuestionIndex]};

    while (answers.length != 4) {
      int answerIndex = Random.secure().nextInt(39);

      answers.add(words[answerIndex]);
    }

    return setShuffling(answers);
  }
}

class AnswerContainer extends StatelessWidget {
  final List<Word> answers;
  final Word question;
  final answerClickedEvent;

  const AnswerContainer({
    required this.question,
    required this.answers,
    required this.answerClickedEvent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...answers
              .map(
                (answer) => TestChoiceContainer(
                  meanings: answer.meanings,
                  clickedEvent: () => answerClickedEvent(
                      question.spelling == answer.spelling, question),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  Word question;

  QuestionContainer({
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question.spelling,
              style: GoogleFonts.bebasNeue(
                fontSize: 58,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade300,
              ),
            ),
            Text(
              question.pronunciation,
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultipleChoiceChallengeAppBarBody extends StatelessWidget {
  const MultipleChoiceChallengeAppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: kTextTabBarHeight + 16),
          // padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Center(
            child: Container(
              height: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
