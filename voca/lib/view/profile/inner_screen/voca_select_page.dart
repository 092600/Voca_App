import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voca/common/const/app_colors.dart';
import 'package:voca/view/account/signup/component/signup_button.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';

class VocaSelectPage extends StatelessWidget {
  const VocaSelectPage({
    super.key,
    required this.vocaMap,
  });

  final Map<LanguageType, Map<String, List<Word>>> vocaMap;

  @override
  Widget build(BuildContext context) {
    final languageFont = GoogleFonts.bebasNeue(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    Map<LanguageType, List<String>> exportThemes = {
      for (var languageType in vocaMap.keys) languageType: []
    };

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "단어장 선택하기",
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...vocaMap.entries
                    .map(
                      (entry) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 45,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      getFullName(
                                        entry.key.name,
                                      ),
                                      style: languageFont,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ...entry.value.keys.map((theme) {
                              return ExportThemeSelectContainer(
                                theme: theme,
                                language: entry.key,
                                exportThemes: exportThemes,
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 30,
        ),
        child: CustomConfirmButton(
          content: "단어장 내보내기",
          onTap: () async {
            for (LanguageType language in exportThemes.keys) {
              final appDocDir = await getApplicationDocumentsDirectory();
              final path = appDocDir.path;

              final Directory languageDir =
                  Directory('$path/${language.name}/');

              final existsLanguageDir = await languageDir.exists();

              if (!existsLanguageDir) {
                languageDir.create(recursive: true);
              }

              for (String theme in exportThemes[language]!) {
                List<List<dynamic>> rows = [];

                for (Word word in vocaMap[language]![theme]!) {
                  List<dynamic> row = [];
                  row.add(word.spelling);
                  row.add(word.pronunciation);
                  row.add(word.meanings
                      .map((wordMeaning) => wordMeaning.meaning)
                      .toList()
                      .join(","));

                  rows.add(row);
                }

                String csv = const ListToCsvConverter().convert(rows);

                try {
                  final file = File('$path/${language.name}/$theme.csv');
                  file.writeAsString(csv);
                } catch (e1) {
                  print(e1);
                }
              }
              print("HERE");
            }
          },
        ),
      ),
    );
  }
}

class ExportThemeSelectContainer extends StatefulWidget {
  ExportThemeSelectContainer({
    super.key,
    required this.language,
    required this.theme,
    required this.exportThemes,
  });

  final String theme;
  final LanguageType language;
  Map<LanguageType, List<String>> exportThemes;

  @override
  State<ExportThemeSelectContainer> createState() =>
      ExportThemeSelectContainerState();
}

class ExportThemeSelectContainerState
    extends State<ExportThemeSelectContainer> {
  bool _isChecked = false;

  final themeFont = GoogleFonts.bebasNeue(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
      ),
      height: 42,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.theme,
                style: themeFont,
              ),
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = !_isChecked;
                  if (_isChecked) {
                    widget.exportThemes[widget.language]!.add(widget.theme);
                  } else {
                    widget.exportThemes[widget.language]!.remove(widget.theme);
                  }

                  print(widget.exportThemes);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future _getStoragePermission() async {
  var storagePermissionStatus = await Permission.storage.request();
  print(storagePermissionStatus);
}
