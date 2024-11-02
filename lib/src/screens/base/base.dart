import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/screens/favorite/favorite_screen.dart';
import 'package:quiz/src/screens/home/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quiz/src/screens/profile/principal_profile.dart';
import 'package:quiz/src/screens/profile/options/profile_screen.dart';
import 'package:quiz/src/screens/search/search.dart';

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
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children:  const [
            HomeScreen(),
            SearchScreen(),
            FavoriteScreen(),
            PrincipalProfile()
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Color(0xFF0A0A0A)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
                selectedIndex: currentindex,
                gap: 8,
                backgroundColor: const Color(0xFF0A0A0A),
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: const Color(0xFFC11357),
                padding: const EdgeInsets.all(16),
                onTabChange: (index) {
                  currentindex = index;
                  pageController.jumpToPage(index);
                },
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.house_fill,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.search,
                    text: 'Pesquisar',
                  ),
                  GButton(
                    icon: CupertinoIcons.heart_fill,
                    text: 'Favoritos',
                  ),
                  GButton(
                    icon: CupertinoIcons.person_fill,
                    text: 'Perfil',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
