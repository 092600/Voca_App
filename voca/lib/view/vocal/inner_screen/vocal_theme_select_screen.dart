import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voca/common/const/app_colors.dart';
import 'package:voca/view/vocal/component/theme_select_card.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';
import '../../../common/providers/local_database_provider.dart';

class VocalThemeSelectScreen extends StatefulWidget {
  final LanguageType language;
  final Map<String, List<Word>> themeOfWords;

  const VocalThemeSelectScreen({
    required this.language,
    required this.themeOfWords,
    super.key,
  });

  @override
  State<VocalThemeSelectScreen> createState() => _VocalThemeSelectScreenState();
}

class _VocalThemeSelectScreenState extends State<VocalThemeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final localDatabaseProvider = Provider.of<LocalDatabaseProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomAppBar(
            title: getFullName(widget.language.name),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: widget.themeOfWords.keys
                  .map(
                    (theme) => ThemeSelectCard(
                      theme: theme,
                      language: widget.language,
                      words: widget.themeOfWords[theme]!,
                      onDelete: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          await localDatabaseProvider.removeTheme(
                            theme: theme,
                            language: widget.language,
                          );
                          widget.themeOfWords.remove(theme);

                          setState(() {});
                        }
                      },
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
