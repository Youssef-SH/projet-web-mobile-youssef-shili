import 'package:club_hub/models/club.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/main_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/main_page.dart';
import 'package:club_hub/pages/club_profile_page.dart';
import 'package:club_hub/pages/clubs_discovery_page.dart';
import 'package:club_hub/pages/complete_club_information_page.dart';
import 'package:club_hub/pages/complete_student_information_page.dart';
import 'package:club_hub/pages/login_page.dart';
import 'package:club_hub/pages/notification_page.dart';
import 'package:club_hub/pages/splash_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  ClubsDiscoveryPage.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as bool;
    return ClubsDiscoveryPage(isLoggedIn: args);
  },

  LoginPage.routeName: (context) => LoginPage(),
  CompleteStudentInformationPage.routeName: (context) =>
      CompleteStudentInformationPage(),
  CompleteClubInformationPage.routeName: (context) =>
      CompleteClubInformationPage(),

  ClubProfilePage.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Club club = args['club'] as Club;
    final bool isLoggedIn = args['isLoggedIn'] as bool;
    return ClubProfilePage(club: club, isLoggedIn: isLoggedIn);
  },

  MainStudentScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as int?;
    return MainStudentScreen(initialPageIndex: args ?? 0);
  },

  MainClubScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as int?;
    return MainClubScreen(initialPageIndex: args ?? 0);
  },

  NotificationPage.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return NotificationPage(accountType: args ?? "Student");
  },
};
