import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:voca/view/vocal/inner_screen/vocal_theme_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../common/data/model/word/word.dart';
import '../../../common/providers/local_database_provider.dart';
import '../inner_screen/vocal_test_type_select_screen.dart';

class VocalSelectCard extends StatelessWidget {
  final String title;
  final bool isTheme;
  final LanguageType languageType;

  const VocalSelectCard({
    required this.title,
    required this.isTheme,
    required this.languageType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localDatabaseProvider = Provider.of<LocalDatabaseProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: FutureBuilder<List<Word>>(
        future: localDatabaseProvider.findWordsByLanguageTypeAndTheme(
          type: languageType,
          theme: title,
        ),
        builder: (context, AsyncSnapshot<List<Word>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            List<Word> questions = snapshot.data!;

            return Container(
              color: Colors.white,
              height: 100,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () {
                    // VocalSelectCard Theme 값에 따라
                    // 1. Theme 값을 받은 경우,
                    //    Words Test Type 선택 > VocalTestTypeSelectScreen();
                    // 2. Theme이 아닌 LanguageType을 받은 경우,
                    //    공부할 단어의 Theme을 선택하도록 > VocalThemeSelectScreen();
                    isTheme
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VocalTestTypeSelectScreen(
                                theme: title,
                                languageType: languageType,
                                questions: questions,
                              ),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VocalThemeSelectScreen(
                                theme: title,
                                languageType: languageType,
                              ),
                            ),
                          );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  title,
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "최근 정답률 : ",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "53 %",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Clicked");
                          // showBottomSheet(context: context, builder: (_) => {

                          // })
                        },
                        child: const SizedBox(
                          child: Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: const Text("데이터를 가져오는 도중 문제가 발생하였습니다.\n다시 시도해주세요."),
            );
          }
        },
      ),
    );
  }
}
