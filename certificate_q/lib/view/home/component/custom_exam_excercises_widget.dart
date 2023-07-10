import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomExamExcercisesWidget extends StatelessWidget {
  final String excerciseTitle;

  const CustomExamExcercisesWidget({
    required this.excerciseTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              excerciseTitle,
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 60,
              color: Colors.red,
              margin: const EdgeInsets.only(top: 9),
            ),
            Container(
              height: 60,
              color: Colors.blue,
              margin: const EdgeInsets.only(top: 9),
            ),
            Container(
              height: 60,
              color: Colors.yellow,
              margin: const EdgeInsets.only(top: 9),
            ),
          ],
        ),
      ),
    );
  }
}
