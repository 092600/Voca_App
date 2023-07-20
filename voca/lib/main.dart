import 'package:voca/view/account/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/view/account/signup/signup_screen.dart';

import 'common/data/database/drift_database.dart';

import 'common/providers/local_database_provider.dart';
import 'common/providers/security_storage_provider.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // WordsProvider 인스턴스 생성
  // WordsProvider wordsProvider = WordsProvider();

  const storage = FlutterSecureStorage();
  final db = LocalDatabase();

  runApp(
    MultiProvider(
      providers: [
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
          "/user/register": (_) => const SignupScreen(),
          // "/user/profile": (_) => SetUserInfoScreen(),
          "/home": (_) => const HomeLayout(),
        });
  }
}
