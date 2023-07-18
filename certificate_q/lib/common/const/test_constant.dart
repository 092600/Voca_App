import 'package:flutter/material.dart';

import 'app_colors.dart';

final List<String> testType = ["사지선다", "철자맞히기", "깜빡이"];
final List<Widget> testTypeIcons = [Dots4, chulja, doubleArrow];
final List<String> testTypeExplain = [
  "문제를 읽고\n정답을 선택하세요",
  "단어의 철자를\n입력하세요",
  "보고만 있거나\n듣고만있거나"
];

final Dots4 = Container(
  child: Column(
    children: [
      Row(
        children: [
          Icon(
            Icons.circle,
            color: appBarBackgroundColor,
            size: 20,
          ),
          const Icon(
            Icons.circle,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
      Row(
        children: [
          const Icon(
            Icons.circle,
            color: Colors.white,
            size: 20,
          ),
          Icon(
            Icons.circle,
            color: appBarBackgroundColor,
            size: 20,
          ),
        ],
      )
    ],
  ),
);

final chulja = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Icon(
      Icons.computer_rounded,
      size: 40,
      color: appBarBackgroundColor,
    ),
  ],
);

final doubleArrow = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Icon(
      Icons.double_arrow_rounded,
      size: 40,
      color: appBarBackgroundColor,
    ),
  ],
);
