import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/const/default.dart';
import '../../../common/datas/models/word.dart';

class ExamBankCard extends StatelessWidget {
  final String title;
  final List<Word> questions;
  const ExamBankCard({required this.title, required this.questions, super.key});

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
              print('InkWell clicked: ');
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
                          title,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            // const Text(
                            //   "챕터 ",
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //   ),
                            // ),
                            // Text(
                            //   "9",
                            //   style: TextStyle(
                            //     color: primaryColor,
                            //     fontSize: 14,
                            //   ),
                            // ),
                            // const Text(
                            //   " | ",
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //   ),
                            // ),
                            const Text(
                              "문제 ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "${questions.length}",
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
                const SizedBox(
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
