import 'package:club_hub/pages/splash_page.dart';
import 'package:club_hub/routes.dart';
import 'package:club_hub/services/api_service.dart';
import 'package:flutter/material.dart';

final apiService = ApiService();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club Hub',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: routes,
    );
  }
}
