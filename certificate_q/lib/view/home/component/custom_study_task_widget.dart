import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStudyTaskWidget extends StatelessWidget {
  const CustomStudyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 15),
              child: Container(
                color: Colors.white,
                child: Text(
                  "STUDY",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            renderStudyCard(task: "일본어 단어 외우기"),
            renderStudyCard(task: "일본어 시험 문제 풀러가기"),
          ],
        ),
      ),
    );
  }

  ListTile renderStudyCard({required task}) {
    return ListTile(
      title: Text(
        task,
        style: GoogleFonts.bebasNeue(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: InkWell(
        onTap: () {
          print("Clicked");
        },
        child: const Icon(
          Icons.star_rounded,
          size: 30,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
