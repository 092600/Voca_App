import 'package:voca/common/data/model/word/word_meaning.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../common/const/app_colors.dart';

class TestChoiceContainer extends StatelessWidget {
  final List<WordMeaning> meanings;
  final Function() clickedEvent;

  const TestChoiceContainer({
    required this.meanings,
    required this.clickedEvent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickedEvent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 43,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            meanings.map((meaning) => meaning.meaning).toList().join(", "),
            style: GoogleFonts.bebasNeue(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
