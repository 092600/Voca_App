import 'package:voca/view/excercise/inner_screen/exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectSelectCard extends StatelessWidget {
  final String subject;

  const SubjectSelectCard({required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Container(
        color: Colors.white,
        height: 100,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamScreen(
                    title: subject,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "D-Day : +20",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            subject,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "진행률 : ",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "53 %",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Clicked");
                    // showBottomSheet(context: context, builder: (_) => {

                    // })
                  },
                  child: const SizedBox(
                    child: Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
