import 'package:flutter/material.dart';
import 'package:quiz/src/screens/favorite.dart';
import 'package:quiz/src/screens/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quiz/src/screens/profile/profile.dart';
import 'package:quiz/src/screens/search.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentindex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          SearchScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFF0A0A0A)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
              selectedIndex: currentindex,
              gap: 8,
              backgroundColor: Color(0xFF0A0A0A),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0xFFC11357),
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                currentindex = index;
                pageController.jumpToPage(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Pesquisar',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favoritos',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Perfil',
                )
              ]),
        ),
      ),
    );
  }
}
