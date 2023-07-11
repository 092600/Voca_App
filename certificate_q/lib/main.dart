import 'package:certificate_q/common/const/default.dart';
import 'package:certificate_q/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'common/data/managing_datas.dart';
import 'common/data/model/word/word.dart';
import 'common/database/drift_database.dart';
import 'common/providers/local_database_provider.dart';
import 'common/providers/security_storage_provider.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // WordsProvider 인스턴스 생성
  // WordsProvider wordsProvider = WordsProvider();

  const storage = FlutterSecureStorage();
  final db = LocalDatabase();

  // db.delWords();

  List<Word> words = await db.findAllWords();

  // 샘플 데이터 추가하기
  if (words.isEmpty) {
    insertSampleWordsIntoDB(db);
    db.createLanguagies(defaultLanguageModels);
  }

  // List<Word> themeWords = await db.findWordByTheme(theme: "N3_사람사귀기, 관계 유지하기");

  // print(themeWords);

  // // CSV 파일을 읽어서 데이터 초기화
  // wordsProvider.init();
  // wordsProvider.loadJapaneseWords();
  // wordsProvider.loadEnglishWords();

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<WordsProvider>(
        //   create: (_) => WordsProvider(),
        // ),SecurityStorageProvider
        ChangeNotifierProvider<SecurityStorageProvider>(
          create: (_) => SecurityStorageProvider(storage),
        ),
        ChangeNotifierProvider<LocalDatabaseProvider>(
          create: (_) => LocalDatabaseProvider(db),
        ),
      ],
      child: const CertificateQApp(),
    ),
  );
}

class CertificateQApp extends StatelessWidget {
  const CertificateQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            displayMedium: GoogleFonts.bebasNeue(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            displaySmall: GoogleFonts.bebasNeue(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        initialRoute: "/login",
        routes: {
          "/login": (_) => const LoginScreen(),
          "/home": (_) => const HomeLayout(),
        });
  }
}
