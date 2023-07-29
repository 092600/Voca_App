import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/component/my_circular_progress_indicator.dart';
import '../../common/const/app_colors.dart';
import '../../common/data/model/goal/goal.dart';
import '../../common/providers/security_storage_provider.dart';
import 'component/my_study_history_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = List.generate(4, (index) => index);

  final ScrollController _scrollController = ScrollController();

  bool isExpanded = true;

  @override
  initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    bool isExpanded = _scrollController.offset < 180;

    if (isExpanded != this.isExpanded) {
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        slivers: [
          CustomAppBar(
            expandedHeight: 380,
            appBarBody: HomeAppBarBody(isExpanded: isExpanded),
            title: "Home",
          ),
          const MyStudyHistoryWidget(),
          // const CustomStudyTaskWidget(),
          // const CustomExamExcercisesWidget(excerciseTitle: "오늘 틀린 문제"),
          // const CustomExamExcercisesWidget(excerciseTitle: "문제 즐겨찾기"),
        ],
      ),
    );
  }
}

class HomeAppBarBody extends StatelessWidget {
  bool isExpanded;
  HomeAppBarBody({required this.isExpanded, super.key});

  @override
  Widget build(BuildContext context) {
    final storageProvider = Provider.of<SecurityStorageProvider>(context);

    return FlexibleSpaceBar(
      background: SafeArea(
        child: FutureBuilder<Goal>(
          future: storageProvider.getTodaysGoal(),
          builder: (context, AsyncSnapshot<Goal> snapshot) {
            if (snapshot.hasData) {
              Goal goal = snapshot.data!;

              return Container(
                margin: const EdgeInsets.only(top: kToolbarHeight),
                child: isExpanded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 215,
                                  height: 215,
                                  child: MyCircularProgressIndicator(
                                    progressValue: int.parse(goal.correctCnt) /
                                        int.parse(goal.todaysGoal),
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 215,
                                  height: 215,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "금일 목표",
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "${goal.correctCnt} / ${goal.todaysGoal}",
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 20,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : null,
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
