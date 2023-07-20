import 'package:provider/provider.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';
import 'package:voca/common/providers/security_storage_provider.dart';

import '../../common/component/custom_app_bar.dart';

import '../../common/const/app_colors.dart';
import 'component/vocal_select_card.dart';

class VocalScreen extends StatelessWidget {
  const VocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storageProvider = Provider.of<SecurityStorageProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "VOCABULARY",
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder<List<LanguageType>>(
                  future: storageProvider.getLanguagies(),
                  builder:
                      (context, AsyncSnapshot<List<LanguageType>> snapshot) {
                    if (snapshot.hasData) {
                      List<LanguageType> languagies = snapshot.data!;

                      return Column(
                        children: languagies
                            .map((language) => VocalSelectCard(
                                  title: getFullName(language.name),
                                  isTheme: false,
                                  languageType: language,
                                ))
                            .toList(),
                      );
                    }

                    return const Center(
                      child: Text("공부하실 언어를 선택해주세요."),
                    );
                  },
                ),
              ],
            ),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     LanguageType.values.map(
          //       (type) {
          //         return VocalSelectCard(
          //           title: getFullName(type
          //               .name), // VocalSelectCard가 LanguageName을 보여주도록 title > LanguageType.name

          //           isTheme:
          //               false, // Words의 Theme이 아니라 LanguageType이 들어가므로 false
          //           languageType: type,
          //         );
          //       },
          //     ).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
