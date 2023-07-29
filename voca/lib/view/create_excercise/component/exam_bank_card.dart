import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voca/view/vocal/inner_screen/vocal_words_detail_screen.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/data/model/word/word.dart';

class ExamBankCard extends StatelessWidget {
  final String theme;
  final List<Word> questions;
  final Function() onTap;

  bool isInstalled = false;

  ExamBankCard({
    required this.theme,
    required this.questions,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 64,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VocalWordsDetailsScreen(
                    title: theme,
                    incorrectWords: questions,
                    inDownloadPage: false,
                    bigFontSize: false,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          theme,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "단어 : ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "${questions.length} 개",
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.download,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
