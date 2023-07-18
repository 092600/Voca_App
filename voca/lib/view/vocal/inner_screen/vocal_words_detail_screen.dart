import 'package:provider/provider.dart';
import 'package:voca/common/data/model/word/word.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/providers/local_database_provider.dart';

class VocalWordsDetailsScreen extends StatefulWidget {
  List<Word> incorrectWords;
  final bool inDownloadPage;

  VocalWordsDetailsScreen({
    required this.incorrectWords,
    required this.inDownloadPage,
    super.key,
  });

  @override
  State<VocalWordsDetailsScreen> createState() =>
      _VocalWordsDetailsScreenState();
}

class _VocalWordsDetailsScreenState extends State<VocalWordsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final localDatabaseProvider = Provider.of<LocalDatabaseProvider>(context);

    // for (var word in widget.incorrectWords) {
    //   print("${word.spelling} : ${word.isFavorite}");
    // }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              widget.incorrectWords
                  .map((word) => Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              word.spelling,
                                              style: GoogleFonts.bebasNeue(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 3,
                                          ),
                                          Container(
                                            child: Text(word.meanings
                                                .map((meaning) =>
                                                    meaning.meaning)
                                                .join(", ")),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.inDownloadPage == false)
                                GestureDetector(
                                  onTap: () {
                                    bool currentFavorite = word.isFavorite;

                                    setState(() {
                                      localDatabaseProvider.addFavorite(
                                        word,
                                        !word.isFavorite,
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // border: Border.all(
                                      //   width: 2,
                                      // ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      word.isFavorite
                                          ? Icons.star_rounded
                                          : Icons.star_border_rounded,
                                      color: Colors.deepOrange,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              Container(
                                width: 5,
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
