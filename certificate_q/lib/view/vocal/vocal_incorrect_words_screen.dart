import 'package:certificate_q/common/datas/models/word.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/default.dart';

class VocalIncorrectWordsScreen extends StatelessWidget {
  List<Word> incorrectWords;

  VocalIncorrectWordsScreen({
    required this.incorrectWords,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              incorrectWords
                  .map((word) => Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
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
                                            child: Text("${word.meanings}"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Clicked");
                                  // showBottomSheet(context: context, builder: (_) => {

                                  // })
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
                                  child: const Icon(
                                    Icons.star_border_rounded,
                                    // color: pointColor,
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
