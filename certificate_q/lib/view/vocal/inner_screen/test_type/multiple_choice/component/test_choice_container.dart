import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../common/const/default.dart';

class TestChoiceContainer extends StatelessWidget {
  final String content;
  final Function() clickedEvent;

  const TestChoiceContainer({
    required this.content,
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
            content,
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
