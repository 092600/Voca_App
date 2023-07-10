import 'package:certificate_q/view/vocal/inner_screen/vocal_theme_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../inner_screen/vocal_test_type_select_screen.dart';

class VocalSelectCard extends StatelessWidget {
  final String theme;
  final bool isTheme;
  final String languageType;

  const VocalSelectCard({
    required this.theme,
    required this.isTheme,
    required this.languageType,
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
            onTap: () {
              isTheme
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VocalTestTypeSelectScreen(
                          theme: theme,
                          languageType: languageType,
                        ),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VocalThemeSelectScreen(
                          theme: theme,
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
      ),
    );
  }
}
