import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:libgenius/BottomNavBar/Screens/AI/chat_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/Profile/profile_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/Search/search_screen.dart';
import 'package:libgenius/BottomNavBar/Screens/home_screen.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Services/push_notification_services.dart';

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
    const ChatScreen(),
    const ProfileScreen(),
  ];

  Future myInitMethid() async {
    await PushNotificationSystem().requestIOSPermissions();
    await PushNotificationSystem().generateAndGetToken();
    await PushNotificationSystem().getAccessToken();
    await PushNotificationSystem().initialingCloudMessaging(Get.context!);
  }

  @override
  void initState() {
    super.initState();
    myInitMethid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Padding(
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
            GButton(icon: Icons.question_answer_rounded, text: 'Chat'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
