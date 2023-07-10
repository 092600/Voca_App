import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:certificate_q/common/const/default.dart';
import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  final String exam;
  const StudyScreen({required this.exam, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: exam,
          ),
        ],
      ),
    );
  }
}
