import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';

class LanguageSelectCard extends StatelessWidget {
  final onTap;
  final LanguageType language;
  final Map<String, List<Word>> words;

  const LanguageSelectCard({
    required this.onTap,
    required this.language,
    required this.words,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Container(
        color: Colors.white,
        height: 100,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: onTap,
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
                            getFullName(language.name),
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
                                "단어장 개수 : ",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${words.keys.length}",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
