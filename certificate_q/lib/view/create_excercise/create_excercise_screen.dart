import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../common/const/default.dart';
import '../../common/data/model/word/word.dart';
import '../../common/providers/local_database_provider.dart';
import '../../common/repository/word_repository.dart';
import 'component/exam_bank_card.dart';

class CreateExcerciseScreen extends StatefulWidget {
  const CreateExcerciseScreen({super.key});

  @override
  State<CreateExcerciseScreen> createState() => _CreateExcerciseScreenState();
}

class _CreateExcerciseScreenState extends State<CreateExcerciseScreen> {
  final numbers = List.generate(5, (index) => index + 1);

  final examSample = [
    "방사선비파괴검사기사",
    "정보처리기능사",
    "SQLD 전문가",
  ];

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
            child: FutureBuilder(
              future: localDatabaseProvider.findWordsThemes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Set<String> installedWordThemes = snapshot.data!;

                  return Column(
                    children: [
                      ...LanguageType.values
                          .map(
                            (lang) => FutureBuilder<Map<String, List<Word>>>(
                              future: WordRepository
                                  .getWordsByLanguageTypeGroupByTheme(
                                lang,
                              ),
                              builder: (context,
                                  AsyncSnapshot<Map<String, List<Word>>>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  Map<String, List<Word>> result =
                                      snapshot.data!;

                                  // print(result);

                                  Map<String, List<Word>> uninstalledWords = {};

                                  for (var theme in result.keys) {
                                    // print("${lang.name}/$theme");
                                    if (!installedWordThemes
                                        .contains("${lang.name}/$theme")) {
                                      uninstalledWords[theme] = result[theme]!;
                                    }
                                  }

                                  return StudyDownloadBox(
                                    theme: lang.name,
                                    widgets: uninstalledWords.keys
                                        .map(
                                          (theme) => ExamBankCard(
                                            theme: theme,
                                            questions: result[theme]!,
                                            onTap: () {
                                              setState(() {
                                                localDatabaseProvider.saveWords(
                                                    words: result[theme]!);

                                                showTopSnackBar(
                                                  Overlay.of(context),
                                                  CustomSnackBar.success(
                                                    message:
                                                        "단어가 단어장에 추가되었습니다.",
                                                    backgroundColor:
                                                        appBarBackgroundColor!,
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                        )
                                        .toList(),
                                  );

                                  // return StudyDownloadBox(
                                  //   theme: lang.name,
                                  //   widgets: result.keys
                                  //       .map(
                                  //         (theme) => ExamBankCard(
                                  //           theme: theme,
                                  //           questions: result[theme]!,
                                  //         ),
                                  //       )
                                  //       .toList(),
                                  // );
                                }

                                return const Text("다시 한번 시도해주세요");
                              },
                            ),
                          )
                          .toList(),
                    ],
                  );
                }

                return Container();
              },
            ),
          )
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
