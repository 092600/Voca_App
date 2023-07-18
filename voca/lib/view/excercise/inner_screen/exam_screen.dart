import 'package:voca/common/component/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/const/app_colors.dart';
import '../component/exam_select_card.dart';

class ExamScreen extends StatelessWidget {
  final String title;
  final exams = [
    "23회 기출",
    "24회 기출",
    "25회 기출",
    "26회 기출",
    "27회 기출",
    "28회 기출",
    "29회 기출",
    "30회 기출",
  ];

  ExamScreen({required this.title, super.key});

  final numbers = List.generate(5, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: title,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              exams
                  .map(
                    (exam) => ExamSelectCard(
                      exam: exam,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
