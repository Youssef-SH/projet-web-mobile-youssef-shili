import 'package:club_hub/main.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/main_page.dart';
import 'package:club_hub/pages/Student%20Primary%20Pages/main_page.dart';
import 'package:club_hub/pages/clubs_discovery_page.dart';
import 'package:club_hub/pages/complete_club_information_page.dart';
import 'package:club_hub/pages/complete_student_information_page.dart';
import 'package:club_hub/services/api_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool obscurePassword = true;
  bool rememberMe = true;
  String? error;

  @override
  void initState() {
    super.initState();
  }

  Future<void> handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        error = "Please fill in both email and password";
      });
    } else {
      setState(() {
        isLoading = true;
        error = null;
      });

      try {
        final userData = await apiService.login(
          email: emailController.text.trim(),
          password: passwordController.text,
          rememberMe: rememberMe,
        );

        // Access user data
        final user = userData['user'];
        debugPrint('Logged in as: ${user['email']}');

        if (mounted) {
          if (user['role'] == "Student") {
            if (user['fullName'] == "") {
              Navigator.pushReplacementNamed(
                context,
                CompleteStudentInformationPage.routeName,
              );
            } else {
              Navigator.pushReplacementNamed(
                context,
                MainStudentScreen.routeName,
              );
            }
          } else {
            if (user['fullName'] == "") {
              Navigator.pushReplacementNamed(
                context,
                CompleteClubInformationPage.routeName,
              );
            } else {
              Navigator.pushReplacementNamed(context, MainClubScreen.routeName);
            }
          }
        }
      } on ApiException {
        setState(() {
          error = "Incorrect email or password";
        });
      } finally {
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF001799), Color(0xFF0039CC), Color(0xFF4FADDC)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    ClubsDiscoveryPage.routeName,
                    arguments: false,
                  );
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Column(
              children: [
                // Animated Logo App
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Image.asset(
                      'images/logo_app.png',
                      width: 300,
                      height: 270,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 30,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Sign In Your Account",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color(0xFF011029),
                                    ),
                              ),
                            ),

                            SizedBox(height: 30),

                            // Email Field
                            createInputField(
                              controller: emailController,
                              icon: Icons.email_rounded,
                              hint: "Email Address",
                              isPassword: false,
                            ),

                            SizedBox(height: 25),

                            // Password Field
                            createInputField(
                              controller: passwordController,
                              icon: Icons.lock_outline_rounded,
                              hint: "Password",
                              isPassword: true,
                            ),

                            SizedBox(height: 5),

                            if (error != null)
                              Text(
                                error!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            SizedBox(height: 25),

                            // Remember Me & Forgot Password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 28,
                                      width: 24,
                                      child: Checkbox(
                                        value: rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            rememberMe = value ?? false;
                                          });
                                        },
                                        activeColor: Color(0xFF011029),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 6),

                                    Text(
                                      'Remember Me',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),

                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    minimumSize: Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color(0xFFD59317),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Sign In Button
                            Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  handleLogin();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF011029),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                              ),
                            ),

                            SizedBox(height: 32),

                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'or',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 24),
                            // Question
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Contact Us',
                                      style: TextStyle(
                                        color: Color(0xFFD59317),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget createInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && obscurePassword,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF011029),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF011029), size: 22),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.grey[500],
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                )
              : null,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }
}
