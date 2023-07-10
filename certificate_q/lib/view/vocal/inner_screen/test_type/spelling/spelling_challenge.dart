import 'package:flutter/material.dart';

import '../../../../../common/component/custom_app_bar.dart';
import '../../../../../common/const/default.dart';

class SpellingChallengeScreen extends StatelessWidget {
  const SpellingChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: "철자맞히기",
          ),
        ],
      ),
    );
  }
}
