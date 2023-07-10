import 'package:certificate_q/common/const/default.dart';
import 'package:certificate_q/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../view/create_excercise/create_excercise_screen.dart';
import '../view/home/home_screen.dart';
import '../view/vocal/vocal_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  initState() {
    super.initState();
    _screens = [
      // ExcerciseScreen(),
      const VocalScreen(),
      const HomeScreen(),
      CreateExcerciseScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          onTap: _onItemTapped,
          items: const [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.stadium),
            //   label: 'Past Exam',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volcano),
              label: 'Vocabulary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.backup),
              label: 'Download',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'MyPage',
            ),
          ],
        ),
      ),
    );
  }
}
