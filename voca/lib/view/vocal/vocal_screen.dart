import 'package:provider/provider.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';
import 'package:voca/common/providers/security_storage_provider.dart';

import '../../common/component/custom_app_bar.dart';

import '../../common/const/app_colors.dart';
import '../../common/data/model/word/word.dart';
import '../../common/providers/local_database_provider.dart';
import 'component/language_select_card.dart';
import 'inner_screen/vocal_theme_select_screen.dart';

class VocalScreen extends StatefulWidget {
  const VocalScreen({super.key});

  @override
  State<VocalScreen> createState() => _VocalScreenState();
}

class _VocalScreenState extends State<VocalScreen> {
  Map<LanguageType, Map<String, List<Word>>> vocaMap = {};
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final storageProvider =
          Provider.of<SecurityStorageProvider>(context, listen: false);
      final localDatabaseProvider =
          Provider.of<LocalDatabaseProvider>(context, listen: false);

      List<LanguageType> languagies = await storageProvider.getLanguagies();

      vocaMap = await localDatabaseProvider.getMapOfWords(languagies);
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "VOCABULARY",
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...vocaMap.keys
                    .map(
                      (language) => LanguageSelectCard(
                        language: language,
                        words: vocaMap[language]!,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VocalThemeSelectScreen(
                                language: language,
                                themeOfWords: vocaMap[language]!,
                              ),
                            ),
                          );

                          // 다음 페이지에서 전달받은 데이터를 처리
                          setState(() {});
                        },
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
