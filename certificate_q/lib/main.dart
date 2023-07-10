import 'package:certificate_q/common/providers/word_provider.dart';
import 'package:certificate_q/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'layout/home_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // WordsProvider 인스턴스 생성
  WordsProvider wordsProvider = WordsProvider();

  // CSV 파일을 읽어서 데이터 초기화
  wordsProvider.init();
  wordsProvider.loadJapaneseWords();
  wordsProvider.loadEnglishWords();

  runApp(
    ChangeNotifierProvider(
      create: (_) => wordsProvider,
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
