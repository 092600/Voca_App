import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voca/view/vocal/inner_screen/vocal_test_type_select_screen.dart';

import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';

class ThemeSelectCard extends StatelessWidget {
  final LanguageType language;
  final String theme;
  final List<Word> words;

  const ThemeSelectCard({
    required this.language,
    required this.theme,
    required this.words,
    required this.onDelete,
    super.key,
  });

  final onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: SizedBox(
        // color: Colors.white,
        height: 100,
        child: Material(
          // color: Colors.white,
          // borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VocalTestTypeSelectScreen(
                    theme: theme,
                    languageType: language,
                    words: words,
                  ),
                ),
              );
            },
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                color: Theme.of(context).colorScheme.error,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: onDelete,
              key: ValueKey(theme),
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              theme,
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
                                  "총 단어 수 : ",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${words.length} 개",
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
