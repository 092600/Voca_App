import 'package:voca/common/component/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../common/const/app_colors.dart';
import 'component/subject_select_card.dart';

class ExcerciseScreen extends StatelessWidget {
  final subject = ["SQLD", "JLPT", "정보처리기능사"];

  ExcerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              subject
                  .map(
                    (item) => SubjectSelectCard(
                      subject: item,
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
