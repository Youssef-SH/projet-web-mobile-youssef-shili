import 'package:club_hub/pages/Club%20Primary%20Pages/home_page.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/event_request_page.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/profile_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/calendar_page.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/settings_page.dart';
import 'package:flutter/material.dart';

class MainClubScreen extends StatefulWidget {
  const MainClubScreen({super.key, this.initialPageIndex = 0});

  static String routeName = "MainClubScreen";
  final int initialPageIndex;

  @override
  State<MainClubScreen> createState() => _MainClubScreenState();
}

class _MainClubScreenState extends State<MainClubScreen> {
  late int currentIndex;

  final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    CalendarPage(),
    EventRequestPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF0A1A3A),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 13,
          unselectedFontSize: 12,
          elevation: 0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_page_outlined),
              activeIcon: Icon(Icons.request_page),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
