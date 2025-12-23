import 'package:club_hub/models/club.dart';
import 'package:club_hub/pages/club_profile_page.dart';
import 'package:club_hub/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClubsDiscoveryPage extends StatelessWidget {
  final bool isLoggedIn;
  ClubsDiscoveryPage({super.key, required this.isLoggedIn});

  static String routeName = "ClubsDiscoveryPage";

  final List<Club> clubs = [
    Club(
      id: '1',
      userId: 'Club',
      name: 'CPU',
      description:
          'Cyber Processing Unit (CPU-ISIMM) is a student-run organization headquartered in ISIMM, Monastir, Tunisia',
      logoUrl: 'images/clubs/cpu.jpg',
    ),
    Club(
      id: '2',
      userId: 'Club',
      name: 'ARSII',
      description:
          'ARSII brings expertise in AI, digital innovation, research support, industry-academia collaboration, training (VET, educators), science outreach, inclusive communication, and event organization to engage youth, researchers, and the general public.',
      logoUrl: 'images/clubs/arsii.jpg',
    ),
    Club(
      id: '3',
      userId: 'Club',
      name: 'ATIA',
      description:
          'ATIA is a university technology club specializing in artificial intelligence with an educational purpose.',
      logoUrl: 'images/clubs/atia.jpg',
    ),
    Club(
      id: '4',
      userId: 'Club',
      name: 'BINARY BEATS',
      description: 'Where Music Ignites Your Soul! ✨',
      logoUrl: 'images/clubs/binary.jpg',
    ),
    Club(
      id: '5',
      userId: 'Club',
      name: 'CRI',
      description:
          'CRI is a group of talented young professionals in robotics design and development at ISIMM',
      logoUrl: 'images/clubs/cri.jpg',
    ),
    Club(
      id: '6',
      userId: 'Club',
      name: 'IEEE',
      description:
          'IEEE is the world\'s largest professional organization striving to advanced technology for humanity.',
      logoUrl: 'images/clubs/ieee.jpg',
    ),
    Club(
      id: '7',
      userId: 'Club',
      name: 'MICROSOFT',
      description: '',
      logoUrl: 'images/clubs/microsoft.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF001799), Color(0xFF0039CC), Color(0xFF4FADDC)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLoggedIn)
                  // Welcome
                  Text(
                    'Welcome to ISIMM ClubHub',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 55,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),

                Text(
                  'Discover Clubs. Tap a card to open the profile.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: isLoggedIn ? 30 : 16,
                    color: isLoggedIn ? Colors.white : Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 16),

                if (!isLoggedIn)
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber.withValues(alpha: 0.2),
                          Colors.orange.withValues(alpha: 0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.amber.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.amber,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Join the community',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Login to follow clubs and stay updated',
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginPage.routeName,
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 24),

                // Grid layout for clubs
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: clubs.length,
                  itemBuilder: (context, index) {
                    return buildCard(context, clubs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, Club club) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          ClubProfilePage.routeName,
          arguments: {'club': club, 'isLoggedIn': isLoggedIn},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Club Logo Background
              Image.asset(club.logoUrl!, fit: BoxFit.cover),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.4),
                      Colors.black.withValues(alpha: 0.9),
                    ],
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Club Name
                    Text(
                      club.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Hover Effect Border
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
