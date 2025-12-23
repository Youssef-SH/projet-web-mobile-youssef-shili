import 'package:club_hub/Widgets/build_post.dart';
import 'package:club_hub/models/club.dart';
import 'package:club_hub/models/post.dart';
import 'package:club_hub/pages/notification_page.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  int selectedTab = 0;
  bool showHeader = true;

  final Club club = Club(
    id: '1',
    userId: 'Club',
    name: 'CPU',
    description:
        'Cyber Processing Unit (CPU-ISIMM) is a student-run organization headquartered in ISIMM, Monastir, Tunisia',
    logoUrl: 'images/clubs/cpu.jpg',
  );

  final List<Post> posts = [
    Post(
      id: '1',
      clubId: '2',
      content: """💻 Git & GitHub Training  🚀
Join us this Saturday at 2:00 PM for an interactive session all about version control!
We'll learn how to manage projects efficiently, collaborate through GitHub, and master the basics of commits, branches, and repositories — all in a hands-on workshop.
📍 Saturday, November 1 - 2:00 PM at ISIMM
☕ A coffee break is included""",
      mediaUrl: "images/posts/cpu/post1.jpg",
      createdAt: 'Yesterday, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '2',
      content: """Day 2 of our Robotics Formation - Step 2 🚀
We took theory to practice and started building our line-follower robots! 🤖
Teamwork, creativity, and innovation in action!""",
      mediaUrl: "images/posts/cpu/post2.jpg",
      createdAt: '28 Octobre, 20:53',
    ),
    Post(
      id: '3',
      clubId: '2',
      content: """🤖 Ready for the next step in the world of robotics?
Join us for the second stage of our robotics journey — a hands-on workshop where you’ll learn to create your own autonomous robot! 🚀
📅 Saturday at 14:00  ISIMM
📅 Sunday at 09:00 Palais des Sciences de Monastir
Don't miss this opportunity to level up your skills and dive deeper into the world of smart machines! 🔧✨
#Robotics #CPU""",
      mediaUrl: "images/posts/cpu/post3.jpg",
      createdAt: '12 Octobre, 21:02',
    ),
  ];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.offset > 50 && showHeader) {
      setState(() => showHeader = false);
    } else if (scrollController.offset <= 50 && !showHeader) {
      setState(() => showHeader = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011029),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF001799), Color(0xFF011029)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Opacity(opacity: showHeader ? 1.0 : 0.0, child: buildHeader()),

              // Toggle Buttons
              buildToggle(),

              // Feed Content
              Expanded(child: buildFeedContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 16),
      height: showHeader ? null : 0,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: showHeader ? null : 0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.orange.shade600],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.dynamic_feed_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feed',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Stay updated with clubs',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NotificationPage.routeName,
                  arguments: "Student",
                );
              },
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: buildToggleButton(
              icon: Icons.explore_rounded,
              label: 'Explore',
              isSelected: selectedTab == 0,
              onTap: () {
                setState(() => selectedTab = 0);
              },
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: buildToggleButton(
              icon: Icons.favorite_rounded,
              label: 'Following',
              isSelected: selectedTab == 1,
              onTap: () {
                setState(() => selectedTab = 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildToggleButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(colors: [Colors.amber, Colors.orange.shade600])
              : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.black : Colors.grey[400],
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey[400],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeedContent() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1200));
      },
      color: Colors.amber,
      backgroundColor: Color(0xFF0A1A3A),
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(top: 16, bottom: 50),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: buildPost(context, club, posts[index]),
            ),
          );
        },
      ),
    );
  }
}
