import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:certificate_q/common/const/default.dart';
import 'package:flutter/material.dart';

class VocalStudyScreen extends StatelessWidget {
  final String theme;
  const VocalStudyScreen({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: theme,
          ),
        ],
      ),
    );
  }
}
