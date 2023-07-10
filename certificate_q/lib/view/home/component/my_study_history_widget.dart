import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/const/default.dart';

class MyStudyHistoryWidget extends StatelessWidget {
  const MyStudyHistoryWidget({
    super.key,
    required this.days,
  });

  final List<int> days;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          color: Colors.white,
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 3),
                child: Text(
                  "HISTORY",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ...days.map(
                      (day) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            SizedBox(
                              // color: Colors.white,
                              height: 70,
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  "$day",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Center(
                                child: Text(
                                  "월",
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
