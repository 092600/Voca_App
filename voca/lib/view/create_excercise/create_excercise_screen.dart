import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:voca/common/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:voca/common/providers/security_storage_provider.dart';

import '../../common/const/app_colors.dart';
import '../../common/data/model/word/word.dart';
import '../../common/data/repository/word_repository.dart';
import '../../common/providers/local_database_provider.dart';
import 'component/exam_bank_card.dart';

class CreateExcerciseScreen extends StatefulWidget {
  const CreateExcerciseScreen({super.key});

  @override
  State<CreateExcerciseScreen> createState() => _CreateExcerciseScreenState();
}

class _CreateExcerciseScreenState extends State<CreateExcerciseScreen> {
  List<LanguageType> languagies = [];
  Map<LanguageType, Map<String, List<Word>>> words = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final storageProvider =
          Provider.of<SecurityStorageProvider>(context, listen: false);
      final localDatabaseProvider =
          Provider.of<LocalDatabaseProvider>(context, listen: false);

      languagies = await storageProvider.getLanguagies();

      for (var lang in languagies) {
        Set<String> themes = await localDatabaseProvider
            .findWordThemesByLanguageType(type: lang);

        Map<String, List<Word>> tmpWords =
            await WordRepository.getWordsByLanguageTypeGroupByTheme(lang);

        for (String theme in themes) {
          tmpWords.remove(theme);
        }

        words[lang] = tmpWords;
      }

      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localDatabaseProvider = Provider.of<LocalDatabaseProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            expandedHeight: kToolbarHeight + 55,
            appBarBody: CreateExcerciseAppBarBody(),
            title: "Download",
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...languagies.map((language) {
                  return StudyDownloadBox(
                    theme: language.name,
                    widgets: words[language]!.keys.isNotEmpty
                        ? words[language]!.keys.map((theme) {
                            return ExamBankCard(
                              theme: theme,
                              questions: words[language]![theme]! ?? [],
                              onTap: () {
                                setState(() {
                                  localDatabaseProvider.saveWords(
                                    words: words[language]![theme]!,
                                  );

                                  words[language]!.remove(theme);

                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      message: "단어가 단어장에 추가되었습니다.",
                                      backgroundColor: appBarBackgroundColor!,
                                    ),
                                  );
                                });
                              },
                            );
                          }).toList()
                        : [
                            Container(
                              height: 50,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  "다운로드할 단어장이 존재하지 않습니다.",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudyDownloadBox extends StatelessWidget {
  const StudyDownloadBox({
    super.key,
    required this.theme,
    required this.widgets,
  });

  final String theme;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 4,
            left: 4,
            top: 10,
          ),
          padding: const EdgeInsets.only(
            right: 5,
            left: 5,
            top: 10,
            bottom: 7,
          ),
          color: Colors.white,
          child: Text(
            theme,
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        renderHorizonLine(context),
        ...widgets,
      ],
    );
  }

  Container renderHorizonLine(BuildContext context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width,
      height: 6,
      margin: const EdgeInsets.only(
        right: 4,
        left: 4,
        bottom: 2,
      ),
    );
  }
}

class CreateExcerciseAppBarBody extends StatelessWidget {
  const CreateExcerciseAppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: kTextTabBarHeight),
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Center(
            child: SizedBox(
              height: 45,
              child: TextFormField(
                cursorColor: Colors.white,
                maxLines: 1,
                style: TextStyle(
                  color: iconColor,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: iconColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: iconColor,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
