import 'package:certificate_q/view/vocal/inner_screen/test_type/multiple_choice/multiple_choice_challenge.dart';
import 'package:certificate_q/view/vocal/inner_screen/test_type/spelling/spelling_challenge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/test_constant.dart';
import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';

class VocalTestTypeSelectScreen extends StatelessWidget {
  final String theme;
  final LanguageType languageType;
  final List<Word> questions;

  const VocalTestTypeSelectScreen({
    required this.theme,
    required this.languageType,
    required this.questions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MultipleChoiceChallengeScreen(
        languageType: languageType,
        questions: questions,
      ),
      const SpellingChallengeScreen(),
      const SpellingChallengeScreen(),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: theme,
          ),
          SliverGrid(
            delegate: SliverChildListDelegate(
              List.generate(3, (index) => index)
                  .map(
                    (index) => Material(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => pages[index]));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: primaryColor?.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  testTypeIcons[index],
                                  Text(
                                    testType[index],
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(testTypeExplain[index]),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
