import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voca/common/const/app_colors.dart';
import 'package:voca/common/const/default.dart';
import 'package:voca/view/account/signup/component/signup_button.dart';

class CsvImportPage extends StatelessWidget {
  const CsvImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _renderHeaderContainer(),
        _renderHorizontalLine(),
        _renderMakeCSVSumamry(),
        _renderCsvButton(),
      ],
    );
  }
}

_renderCsvButton() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: CustomConfirmButton(
      onTap: () async {
        try {
          final appDir = await getApplicationDocumentsDirectory();

          print(appDir.path);

          // FilePickerResult? result = await FilePicker.platform.pickFiles(
          //   initialDirectory: appDir.path,
          //   // type: FileType.custom,
          //   // allowedExtensions: ['csv'],
          // );
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            print(result);
          }
          print(result);
        } catch (e) {
          print("HERE");
          print(e);
        }

        // if (result == null) return;

        // final file = result.files.first;
        // openFile(file);
      },
      content: "단어 등록하기",
    ),
  );
}

_renderMakeCSVSumamry() {
  final summaryFont = GoogleFonts.bebasNeue(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    height: 290,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...IMPORT_CSV_SUMMARY
            .asMap()
            .entries
            .map(
              (entry) => Container(
                child: Text(
                  "${entry.key + 1}.  ${entry.value}",
                  style: summaryFont,
                ),
              ),
            )
            .toList(),
      ],
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
          "\"엑셀 또는 Numbers\" 를 사용하여",
          style: headerFont,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "많은 양의 단어들을",
          style: headerFont,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "간단하게 추가할 수 있어요.",
          style: headerFont,
        ),
      ],
    ),
  );
}

void openFile(PlatformFile file) {
  print(file);
  // OpenFilex.open(file);
}
