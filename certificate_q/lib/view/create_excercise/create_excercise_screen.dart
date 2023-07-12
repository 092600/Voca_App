import 'package:certificate_q/common/component/custom_app_bar.dart';
import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/const/default.dart';
import '../../common/providers/local_database_provider.dart';
import '../../common/repository/word_repository.dart';

class CreateExcerciseScreen extends StatelessWidget {
  final numbers = List.generate(5, (index) => index + 1);

  final examSample = [
    "방사선비파괴검사기사",
    "정보처리기능사",
    "SQLD 전문가",
  ];

  CreateExcerciseScreen({super.key});

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
                ...LanguageType.values
                    .map((lang) => FutureBuilder(
                          future:
                              WordRepository.getWordsByLanguageTypeGroupByTheme(
                            lang,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(lang.name);
                            }

                            return const Text("다시 한번 시도해주세요");
                          },
                        ))
                    .toList(),
                // FutureBuilder(
                //   future: WordRepository.getWordsByLanguageType(),
                //   builder: ((context, AsyncSnapshot<> snapshot) {
                //     if (snapshot.hasData) {
                //       List<Word2> words = snapshot.data;

                //       // Container(
                //       //   child: const Text("Here"),
                //       // );
                //     }

                //     return const Text("다시 한번 시도해주세요");
                //   }),
                // ),
              ],
            ),
          )
          // SliverToBoxAdapter(
          //   child: FutureBuilder<List<LanguageModel>>(
          //     future: localDatabaseProvider.findAllLanguagies(),
          //     builder: (context, AsyncSnapshot<List<LanguageModel>> snapshot) {
          //       if (snapshot.hasData) {
          //         List<LanguageModel> langs = snapshot.data!;

          //         return Column(
          //           children: langs
          //               .map(
          //                 (lang) => FutureBuilder<Set<String>>(
          //                   future: localDatabaseProvider
          //                       .findWordsThemeByLanguageType(
          //                           lang.languageType),
          //                   builder:
          //                       (context, AsyncSnapshot<Set<String>> snapshot) {
          //                     if (snapshot.hasData) {
          //                       Set<String> themes = snapshot.data!;
          //                       return StudyDownloadBox(
          //                         index: 0,
          //                         theme: lang.languageTitle,
          //                         widgets: themes
          //                             .map((theme) => FutureBuilder<List<Word>>(
          //                                   future: localDatabaseProvider
          //                                       .findWordsByLanguageTypeAndTheme(
          //                                     type: lang.languageType,
          //                                     theme: theme,
          //                                   ),
          //                                   builder: (context,
          //                                       AsyncSnapshot<List<Word>>
          //                                           snapshot) {
          //                                     if (snapshot.hasData) {
          //                                       List<Word> words =
          //                                           snapshot.data!;
          //                                       return ExamBankCard(
          //                                         title: theme,
          //                                         questions: words,
          //                                       );
          //                                     }

          //                                     return Container();
          //                                   },
          //                                 ))
          //                             .toList(),
          //                       );
          //                     }

          //                     return Container(
          //                       child: const Text(
          //                           "데이터를 불러오는 도중 에러가 발생하였습니다.\n다시 시도해주세요"),
          //                     );
          //                   },
          //                 ),
          //               )
          //               .toList(),
          //         );
          //         // return langs.map(
          //         //   (lang) => ExamBankCard(
          //         //     title: lang.languageTitle,
          //         //     questions: const [],
          //         //   ),
          //         // );
          //       }

          //       return Container(
          //         child: const Text("데이터를 불러오는 도중 에러가 발생하였습니다.\n다시 시도해주세요"),
          //       );
          //     },
          //   ),
          // ),
          // StudyDownloadBox(
          //   index: 0,
          //   theme: "Japanese Vocabulary",
          //   widgets: jpVocal.keys.map((key) {
          //     return ExamBankCard(
          //       title: key,
          //       questions: jpVocal[key]!,
          //     );
          //   }).toList(),
          // ),
          // StudyDownloadBox(
          //   theme: "English Vocabulary",
          //   widgets: engVocal.keys.map((key) {
          //     return ExamBankCard(
          //       title: key,
          //       questions: engVocal[key]!,
          //     );
          //   }).toList(),
          // ),
          // StudyDownloadBox(
          //   theme: "Past Exam",
          //   widgets: examSample.map((title) {
          //     return ExamBankCard(
          //       title: title,
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}

class StudyDownloadBox extends StatelessWidget {
  StudyDownloadBox({
    super.key,
    this.index = 1,
    required this.theme,
    required this.widgets,
  });

  int index;
  final String theme;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 4,
            left: 4,
            top: index == 0 ? 7 : 18,
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
