import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/view/profile/inner_screen/voca_select_page.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/data/model/word/type/language_type.dart';
import '../../../common/data/model/word/word.dart';
import '../../../common/providers/local_database_provider.dart';
import '../../../common/providers/security_storage_provider.dart';
import '../../account/signup/component/signup_button.dart';

class CsvExportPage extends StatefulWidget {
  const CsvExportPage({super.key});

  @override
  State<CsvExportPage> createState() => _CsvExportPageState();
}

class _CsvExportPageState extends State<CsvExportPage> {
  Map<LanguageType, Map<String, List<Word>>> vocaMap = {};
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final storageProvider =
          Provider.of<SecurityStorageProvider>(context, listen: false);
      final localDatabaseProvider =
          Provider.of<LocalDatabaseProvider>(context, listen: false);

      List<LanguageType> languagies = await storageProvider.getLanguagies();

      vocaMap = await localDatabaseProvider.getMapOfWords(languagies);
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _renderHeaderContainer(),
        _renderHorizontalLine(),
        const SizedBox(
          height: 310,
        ),
        _renderCsvButton(context, vocaMap),
      ],
    );
  }
}

_renderCsvButton(context, Map<LanguageType, Map<String, List<Word>>> vocaMap) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: CustomConfirmButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VocaSelectPage(vocaMap: vocaMap),
          ),
        );
      },
      content: "단어장 선택하기",
    ),
  );
}

_renderHorizontalLine() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    height: 4,
    color: primaryColor,
  );
}

_renderHeaderContainer() {
  final headerFont = GoogleFonts.bebasNeue(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  return SizedBox(
    // color: Colors.red,
    height: 130,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "다운로드한 단어장의 단어들을",
          style: headerFont,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          "CSV 파일 형태로 변환할 수 있습니다.",
          style: headerFont,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          "변환할 단어장을 선택해주세요.",
          style: headerFont,
        ),
      ],
    ),
  );
}
