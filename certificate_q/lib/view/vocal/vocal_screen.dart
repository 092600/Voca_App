import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_app_bar.dart';

import '../../common/const/app_colors.dart';
import 'component/vocal_select_card.dart';

class VocalScreen extends StatelessWidget {
  const VocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              LanguageType.values.map(
                (type) {
                  return VocalSelectCard(
                    title: getFullName(type
                        .name), // VocalSelectCard가 LanguageName을 보여주도록 title > LanguageType.name

                    isTheme:
                        false, // Words의 Theme이 아니라 LanguageType이 들어가므로 false
                    languageType: type,
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
