import 'package:club_hub/Widgets/build_post.dart';
import 'package:club_hub/models/club.dart';
import 'package:club_hub/models/post.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/main_page.dart';
import 'package:club_hub/pages/clubs_discovery_page.dart';
import 'package:club_hub/pages/login_page.dart';
import 'package:flutter/material.dart';

class ClubProfilePage extends StatefulWidget {
  const ClubProfilePage({
    required this.club,
    required this.isLoggedIn,
    super.key,
  });

  final Club club;
  final bool isLoggedIn;

  static String routeName = "ClubProfilePage";

  @override
  State<ClubProfilePage> createState() => _ClubProfilePageState();
}

class _ClubProfilePageState extends State<ClubProfilePage> {
  bool isFollowing = false;
  bool isLoading = false;

  late List<Post> selectedPosts;

  final List<Post> cpuPosts = [
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

  final List<Post> arsiiPosts = [
    Post(
      id: '1',
      clubId: '2',
      content:
          """✨𝑨𝑹𝑺𝑰𝑰_𝑰𝑺𝑰𝑴𝑴 𝑪𝑳𝑼𝑩 𝒔𝒑𝒊𝒓𝒊𝒕 𝒊𝒔 𝒄𝒐𝒎𝒊𝒏𝒈 𝒂𝒍𝒊𝒗𝒆✨
Join us for a Team Building afternoon packed with energy, laughter, and teamwork🎯
📆 This Friday, October 31st 
⏰ at 4 PM 
📍at ISIMM 
#ARSII #arsii_agit #arsii_isimm #teambuilding""",
      mediaUrl: "images/posts/arsii/post1.png",
      createdAt: 'Yesterday, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '2',
      content: """Missed our Integration Day?
No worries - we're still recruiting! Join the ARSII Club ISIMM family and be part of something big.✨
Scan the QR code to apply and let's build innovation together!""",
      mediaUrl: "images/posts/arsii/post2.png",
      createdAt: '28 Octobre, 20:53',
    ),
    Post(
      id: '3',
      clubId: '2',
      content: """🖋️ 𝑼𝒏𝒆 𝒂𝒍𝒍𝒊𝒂𝒏𝒄𝒆 𝒅’𝒂𝒗𝒆𝒏𝒊𝒓 !
L'ARSII et Dar Blockchain s’engagent pour un futur commun autour de l’innovation, la blockchain et la formation de talents numériques 💡🤩  
🎯 𝐎𝐛𝐣𝐞𝐜𝐭𝐢𝐟 : développer des projets communs, former les talents de demain et renforcer l’écosystème numérique. 
🤩 Un partenariat à suivre de près 👀""",
      mediaUrl: "images/posts/arsii/post3.png",
      createdAt: '12 Octobre, 21:02',
    ),
  ];

  final List<Post> atiaPosts = [
    Post(
      id: '1',
      clubId: '3',
      content:
          """Throwback to AI Horizons 3.0 – a day of innovation, inspiration, and unforgettable moments! ✨
            #AIHorizons3 #Flashback""",
      mediaUrl: "images/posts/atia/post1.png",
      createdAt: '9 March, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '3',
      content:
          """Throwback to Al Horizons 3.0 - a day of innovation, inspiration, and unforgettable moments!✨
#AlHorizons3 #Flashback""",
      mediaUrl: "images/posts/atia/post2.png",
      createdAt: '9 March, 15:53',
    ),
    Post(
      id: '3',
      clubId: '3',
      content: """Check your emails 📧🕵️‍♂️""",
      mediaUrl: "images/posts/atia/post3.png",
      createdAt: '5 March, 21:02',
    ),
  ];

  final List<Post> binaryPosts = [
    Post(
      id: '1',
      clubId: '4',
      content: """Our dedicated executive team, turning passion into music!✨
#binarybeatsclub""",
      mediaUrl: "images/posts/binary/post1.png",
      createdAt: '9 March, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '4',
      content:
          """Get ready to experience Rhythms & Riddles - a day of music, fun, and unforgettable memories! Join us on November 13th at ISIMM, starting at 4:30 PM, for a musical journey inspired by your favorite Spacetoon characters and vibes! 🚀🎤
Don't miss out on the excitement, surprises, and pure nostalgia - see you there! 🌟
 #BinaryBeats #rhythmsandriddles #ISIMM""",
      mediaUrl: "images/posts/binary/post2.png",
      createdAt: '9 March, 15:53',
    ),
    Post(
      id: '3',
      clubId: '4',
      content: """Ne manquez pas cet événement !
Rejoignez-nous à notre réunion générale de Binary Beats.
Des moments passionnants vous attendent, soyez nombreux ! ✨""",
      mediaUrl: "images/posts/binary/post3.png",
      createdAt: '5 March, 21:02',
    ),
  ];

  final List<Post> criPosts = [
    Post(
      id: '1',
      clubId: '5',
      content:
          """Looking back at Crifest fills us with so much joy! 🌟 A day full of knowledge, creativity, and collaboration. 
From engaging workshops to exciting STM32 and Arduino training sessions.
Endless thanks to our incredible trainers @Ya SSine ben Abdallah and Bechir Gara , and to everyone who joined us for making it truly memorable! ❤️🙌""",
      mediaUrl: "images/posts/cri/post1.jpg",
      createdAt: '9 March, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '5',
      content:
          """We're thrilled to welcome Soura Ghalia as the new President of Club Robotique ISIMM CRI! 🌟 
A new chapter begins, get ready for great things ahead! ❤️‍🔥""",
      mediaUrl: "images/posts/cri/post2.jpg",
      createdAt: '9 March, 15:53',
    ),
    Post(
      id: '3',
      clubId: '5',
      content: """CRIFEST V3.0 Registrations Are Open! 📢
Dive into the world of innovation and level up your skills! Join us for CRIFEST V3.0 on October 25th at 1:45PM at ISIMM, a day full of hands-on training sessions, including Arduino and STM32 workshops, perfect for all tech enthusiasts! ❤️‍🔥✨
Select your session, register now, and secure your spot for an unforgettable learning experience. 🤖❤️""",
      mediaUrl: "images/posts/cri/post3.jpg",
      createdAt: '5 March, 21:02',
    ),
  ];

  final List<Post> ieeePosts = [
    Post(
      id: '1',
      clubId: '6',
      content: """🤝✨ IEEE Day Collaboration Announcement ✨🤝
On the occasion of IEEE Day, we are delighted to announce a special collaboration between ISIM Monastir IEEE Student Branch and Ecole Polytechnique de Sousse IEEE Student Branch 🎉""",
      mediaUrl: "images/posts/ieee/post1.jpg",
      createdAt: '9 March, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '6',
      content:
          """Êtes-vous prêt à améliorer votre parcours et à vous connecter avec une communauté mondiale d'innovateurs ? 🌟
💡 Que votre passion réside dans l'ingénierie, la technologie ou la découverte scientifique, la branche étudiante IEEE ISIMM est votre base de lancement pour :
⚡ Acquérir de nouvelles compétences
⚡ Construire des connexions significatives
⚡ Travaux sur des projets percutants
🔥 Pourquoi nous rejoindre ?
✨ Ateliers interactifs & événements de pointe
✨ Accès direct aux dirigeants et experts de l'industrie
✨ Projets pratiques, défis et compétitions
✨ Opportunités de mentorat et de développement de carrière
🎯 Pour chaque étudiant. Quels que soient vos antécédents ou vos intérêts, il y a un endroit où VOUS pouvez grandir, apprendre et prospérer avec nous !
🚀 Ne vous contentez pas de suivre l'avenir - créez-le avec la branche étudiante IEEE ISIMM !""",
      mediaUrl: "images/posts/ieee/post2.jpg",
      createdAt: '9 March, 15:53',
    ),
    Post(
      id: '3',
      clubId: '6',
      content:
          """We are thrilled to announce that our brilliant member, Oumeima BACCOUCHE, has been selected as the TSYP13 Ambassador to represent our Student Branch at the IEEE Tunisia Section Young Professionals Congress!
We are incredibly proud of Oumeima and have full confidence that she will represent our branch with excellence and passion. The entire IEEE ISIMM SB is behind you all the way!
Congratulations on this well-deserved honor! We can't wait to see you shine. 👏""",
      mediaUrl: "images/posts/ieee/post3.jpg",
      createdAt: '5 March, 21:02',
    ),
  ];

  final List<Post> microsoftPosts = [
    Post(
      id: '1',
      clubId: '7',
      content: """✨ 𝕊𝕡𝕖𝕔𝕚𝕒𝕝 𝔾𝕦𝕖𝕤𝕥 𝔸𝕝𝕖𝕣𝕥 ✨
🚀 We’re thrilled to welcome Hamza Rhibi — Software Engineer & SRE at Google — this Monday at 8:00 PM (Google Meet)!
He’ll be sharing his journey and experience in Competitive Programming 🧠💻
Don’t miss this incredible opportunity! 🔥
#mtc #Google #competitiveprogramming #ISIMM #TechTalk #CPJourney""",
      mediaUrl: "images/posts/microsoft/post1.jpg",
      createdAt: '9 March, at 19:44',
    ),
    Post(
      id: '2',
      clubId: '7',
      content: """[🏆 CodeArena — Cinq meilleurs codeurs ⚡]
Voici notre Top 5 des codeurs qui ont brillé dans CodeArena, le premier concours de l'année ! 💻🔥
Leur compétence, leur concentration et leur détermination leur ont valu une place au sommet. Toutes mes félicitations à :
🥇 Louay Makhloufi
🥈 Khalil Khouildi
🥉 Anas selmi
🏅 Aslam Gaied
🏅 Yessine Gaddour
Vous avez donné le ton pour une saison incroyable à venir ! 💪⚔️""",
      mediaUrl: "images/posts/microsoft/post2.jpg",
      createdAt: '9 March, 15:53',
    ),
    Post(
      id: '3',
      clubId: '7',
      content: """[💻 Réfléchissez. Code. Gagner.]
Rejoignez notre premier concours de codage adapté aux débutants et prouvez votre puissance logique 💪""",
      mediaUrl: "images/posts/microsoft/post3.jpg",
      createdAt: '5 March, 21:02',
    ),
  ];

  void toggleFollow() async {
    if (!widget.isLoggedIn) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      return;
    }

    setState(() {
      isLoading = true;
    });

    // TODO: Add your API call here to follow/unfollow the club
    // Example:
    // if (isFollowing) {
    //   await unfollowClub(widget.club.id);
    // } else {
    //   await followClub(widget.club.id);
    // }

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      isFollowing = !isFollowing;
      isLoading = false;
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFollowing
              ? '✅ You are now following ${widget.club.name}'
              : '❌ Unfollowed ${widget.club.name}',
        ),
        backgroundColor: isFollowing ? Colors.green : Colors.grey[800],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  List<Post> getSelectedPosts(String clubName) {
    switch (clubName) {
      case 'CPU':
        return cpuPosts;
      case 'ARSII':
        return arsiiPosts;
      case 'ATIA':
        return atiaPosts;
      case 'BINARY BEATS':
        return binaryPosts;
      case 'CRI':
        return criPosts;
      case 'IEEE':
        return ieeePosts;
      case 'MICROSOFT':
        return microsoftPosts;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    selectedPosts = getSelectedPosts(widget.club.name);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF011029),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120),

                  // Profile header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withValues(alpha: 0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              widget.club.logoUrl!,
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.club.name,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' posts',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 20),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '520',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' followers',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              // Follow button
                              AnimatedContainer(
                                width: double.infinity,
                                duration: const Duration(milliseconds: 300),
                                child: ElevatedButton.icon(
                                  onPressed: isLoading ? null : toggleFollow,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    backgroundColor: isFollowing
                                        ? Colors.white.withValues(alpha: 0.2)
                                        : Colors.amber,
                                    foregroundColor: isFollowing
                                        ? Colors.white
                                        : Colors.black,
                                    elevation: isFollowing ? 0 : 4,
                                    shadowColor: Colors.amber.withValues(
                                      alpha: 0.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                        color: isFollowing
                                            ? Colors.white.withValues(
                                                alpha: 0.5,
                                              )
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  icon: isLoading
                                      ? SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  isFollowing
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        )
                                      : Icon(
                                          isFollowing ? Icons.check : Icons.add,
                                          size: 24,
                                        ),
                                  label: Text(
                                    isFollowing ? 'Following' : 'Follow',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // About Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      widget.club.description!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),

                  // SizedBox(height: 32),
                  Divider(height: 50, indent: 70, endIndent: 70),

                  // Publications Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.article,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Publications',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  buildPost(context, widget.club, selectedPosts[0]),
                  buildPost(context, widget.club, selectedPosts[1]),
                  buildPost(context, widget.club, selectedPosts[2]),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (widget.isLoggedIn) {
                          Navigator.pushReplacementNamed(
                            context,
                            MainStudentScreen.routeName,
                            arguments: 1,
                          );
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            ClubsDiscoveryPage.routeName,
                            arguments: widget.isLoggedIn,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Club Profile',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
