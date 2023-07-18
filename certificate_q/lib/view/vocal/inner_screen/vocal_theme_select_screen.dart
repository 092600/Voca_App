import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/providers/local_database_provider.dart';
import '../component/vocal_select_card.dart';

class VocalThemeSelectScreen extends StatelessWidget {
  final String theme;
  final LanguageType languageType;

  VocalThemeSelectScreen({
    required this.theme,
    required this.languageType,
    super.key,
  });

  final numbers = List.generate(5, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final localDatabaseProvider = Provider.of<LocalDatabaseProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: theme,
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<Set<String>>(
              future: localDatabaseProvider.findWordThemesByLanguageType(
                type: languageType,
              ),
              builder:
                  (BuildContext context, AsyncSnapshot<Set<String>> snapshot) {
                if (snapshot.hasData) {
                  final Set<String> themes = snapshot.data!;

                  return Column(
                    children: themes
                        .map(
                          (theme) => VocalSelectCard(
                            isTheme: true,
                            title: theme,
                            languageType: languageType,
                          ),
                        )
                        .toList(),
                  );
                }
                return Container(); // Add a return statement here if needed
              },
            ),
          ),
        ],
      ),
    );
  }
}
