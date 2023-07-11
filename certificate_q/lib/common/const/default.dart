import 'package:certificate_q/common/data/model/language/language_model.dart';
import 'package:flutter/material.dart';

import '../data/model/word/language_type.dart';

// color
Color? backgroundColor = Colors.grey[300];
Color? appBarBackgroundColor = Colors.green;
Color? primaryColor = const Color(0xFF266777);

Color iconColor = const Color(0xFFd4fbff);

String appBarTitle = "CQ";

final languagies = {"Japanese": LanguageType.JP, "English": LanguageType.ENG};
// LanguageType.JP

const LANGUAGIES = "languagies";

List<LanguageModel> defaultLanguageModels = [
  LanguageModel(languageTitle: "Japanese", languageType: LanguageType.JP),
  LanguageModel(languageTitle: "English", languageType: LanguageType.ENG),
];
