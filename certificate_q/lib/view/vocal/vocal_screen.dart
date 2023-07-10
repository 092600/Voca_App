import 'package:flutter/material.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/default.dart';
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
              languagies.keys.map(
                (key) {
                  return VocalSelectCard(
                    isTheme: false,
                    theme: key,
                    languageType: languagies[key] as String,
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
