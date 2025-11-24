import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:libgenius/BottomNavBar/Screens/AI/ai_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/Profile/profile_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/Search/search_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/home_screen.dart';
import 'package:libgenius/Global/colors.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AiScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            color: Colors.white70,
            activeColor: Colors.white,
            tabBackgroundColor: mainThemeColor.withValues(alpha: 0.3),

            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

            tabs: const [
              GButton(icon: Icons.home_filled, text: 'Home'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.ac_unit_sharp, text: 'Ai'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
