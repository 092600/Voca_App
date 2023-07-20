import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/common/const/app_colors.dart';

import '../../../common/data/model/goal/goal.dart';
import '../../../common/providers/security_storage_provider.dart';

class MyStudyHistoryWidget extends StatelessWidget {
  const MyStudyHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final storageProvider = Provider.of<SecurityStorageProvider>(context);

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
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Goal>>(
                  future: storageProvider.get1WeekGoals(),
                  builder: (context, AsyncSnapshot<List<Goal>> snapshot) {
                    if (snapshot.hasData) {
                      List<Goal> goals = snapshot.data!;
                      for (Goal goal in goals) {}

                      return Row(
                        children: <Widget>[
                          ...goals.map(
                            (goal) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    // color: Colors.amber,
                                    height: 65,
                                    width: 65,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        goal.day.split("/")[2],
                                        // goal.day.substring(5, 10),
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: int.parse(goal.correctCnt) /
                                            int.parse(goal.todaysGoal),
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Center(
                                      child: Text(
                                        goal.dayName,
                                        // dates[goal. - 20],
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
