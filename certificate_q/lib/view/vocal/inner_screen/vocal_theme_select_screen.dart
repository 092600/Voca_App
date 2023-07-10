import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:certificate_q/common/const/default.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/providers/word_provider.dart';
import '../component/vocal_select_card.dart';

class VocalThemeSelectScreen extends StatelessWidget {
  final String theme;
  final String languageType;

  VocalThemeSelectScreen({
    required this.theme,
    required this.languageType,
    super.key,
  });

  final numbers = List.generate(5, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final wordsProvider = Provider.of<WordsProvider>(context);
    final themes = wordsProvider.words[languagies[theme]];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: theme,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              themes!.keys
                  .map(
                    (theme) => VocalSelectCard(
                      isTheme: true,
                      theme: theme,
                      languageType: languageType,
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
