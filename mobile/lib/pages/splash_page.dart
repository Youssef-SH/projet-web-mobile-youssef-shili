import 'package:club_hub/pages/clubs_discovery_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String routeName = "SplashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController logoController;
  late Animation<double> logoScaleAnimation;
  late Animation<double> logoOpacityAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animation controller
    logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    // Logo scale animation
    logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeOutBack),
    );

    // Logo opacity animation
    logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    startAnimation();
  }

  void startAnimation() async {
    await logoController.forward();
    await Future.delayed(Duration(milliseconds: 1000));

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        ClubsDiscoveryPage.routeName,
        arguments: false,
      );
    }
  }

  @override
  void dispose() {
    logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final logoSize = media.size.width * 0.8;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF001799),
                    Color(0xFF0039CC),
                    Color(0xFF4FADDC),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedBuilder(
              animation: logoController,
              builder: (context, child) {
                return Opacity(
                  opacity: logoOpacityAnimation.value,
                  child: ScaleTransition(
                    scale: logoScaleAnimation,
                    child: child,
                  ),
                );
              },

              child: Image.asset(
                'images/logo_app.png',
                width: logoSize,
                height: logoSize,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
