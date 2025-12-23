import 'package:club_hub/pages/Student%20Primary%20Pages/calendar_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/event_attendance_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/feed_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/settings_page.dart';
import 'package:club_hub/pages/clubs_discovery_page.dart';
import 'package:flutter/material.dart';

class MainStudentScreen extends StatefulWidget {
  const MainStudentScreen({super.key, this.initialPageIndex = 0});

  static String routeName = "MainStudentScreen";
  final int initialPageIndex;

  @override
  State<MainStudentScreen> createState() => _MainStudentScreenState();
}

class _MainStudentScreenState extends State<MainStudentScreen> {
  late int currentIndex;

  final List<Widget> pages = [
    FeedPage(),
    ClubsDiscoveryPage(isLoggedIn: true),
    CalendarPage(),
    EventAttendancePage(),
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
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_2_outlined),
              activeIcon: Icon(Icons.groups),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_outlined),
              activeIcon: Icon(Icons.qr_code_scanner),
              label: 'Attendance',
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
