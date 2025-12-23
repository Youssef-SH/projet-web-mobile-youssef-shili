import 'package:club_hub/Widgets/progress_bar_widget.dart';
import 'package:club_hub/pages/Club%20Primary%20Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CompleteClubInformationPage extends StatefulWidget {
  const CompleteClubInformationPage({super.key});

  static String routeName = "CompleteClubInformationPage";

  @override
  State<CompleteClubInformationPage> createState() =>
      _CompleteClubInformationPageState();
}

class _CompleteClubInformationPageState
    extends State<CompleteClubInformationPage> {
  int currentStep = 1;
  final int totalSteps = 3;
  final PageController pageController = PageController();

  // Controllers for form inputs
  final TextEditingController clubNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  XFile? clubLogo;

  // President Info Controllers
  final TextEditingController presidentFullNameController =
      TextEditingController();
  final TextEditingController presidentCinController = TextEditingController();
  final TextEditingController presidentPhoneController =
      TextEditingController();
  final TextEditingController presidentEmailController =
      TextEditingController();
  final TextEditingController presidentSpecializationController =
      TextEditingController();
  String? presidentStudyLevel;

  // Vice-President Info Controllers

  final TextEditingController vicePresidentFullNameController =
      TextEditingController();
  final TextEditingController vicePresidentCinController =
      TextEditingController();
  final TextEditingController vicePresidentPhoneController =
      TextEditingController();
  final TextEditingController vicePresidentEmailController =
      TextEditingController();
  final TextEditingController vicePresidentSpecializationController =
      TextEditingController();
  String? vicePresidentStudyLevel;

  final ImagePicker picker = ImagePicker();

  Future<void> pickLogo() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        clubLogo = image;
      });
    }
  }

  void nextStep() {
    if (currentStep < totalSteps) {
      setState(() {
        currentStep++;
      });
      pageController.animateToPage(
        currentStep - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // All steps completed
      Navigator.pushReplacementNamed(context, MainClubScreen.routeName);
    }
  }

  void previousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
      pageController.animateToPage(
        currentStep - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    clubNameController.dispose();
    descriptionController.dispose();
    presidentFullNameController.dispose();
    presidentCinController.dispose();
    presidentPhoneController.dispose();
    presidentEmailController.dispose();
    presidentSpecializationController.dispose();
    vicePresidentFullNameController.dispose();
    vicePresidentCinController.dispose();
    vicePresidentEmailController.dispose();
    vicePresidentPhoneController.dispose();
    vicePresidentSpecializationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: currentStep == 1
            ? null
            : IconButton(
                onPressed: previousStep,
                icon: Icon(Icons.arrow_back, color: Colors.black),
              ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Complete your Club Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Step $currentStep of $totalSteps',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ProgressBar(currentStep: currentStep, totalSteps: totalSteps),
              ],
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildGeneralInfoStep(),
                buildAdminInfoStep(role: "President"),
                buildAdminInfoStep(role: "Vice-President"),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildGeneralInfoStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Club Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            'Please provide your club information',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 24),

          // Full Name Input
          Text(
            'Club Name',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: clubNameController,
            decoration: InputDecoration(
              hintText: 'Enter your Club Name',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF4D5DFA), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          SizedBox(height: 20),

          Text(
            'Club Logo',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8),

          GestureDetector(
            onTap: pickLogo,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: clubLogo != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(clubLogo!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tap to upload logo',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
            ),
          ),

          SizedBox(height: 20),

          Text(
            'Description',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8),

          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Enter club description',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF4D5DFA), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),

          SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4D5DFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAdminInfoStep({required String role}) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Club Administration',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            "Add Club's Executive Committee",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 20),

          buildTextField(
            label: "$role's Full Name",
            hint: "Enter $role's Full Name",
            controller: role == "President"
                ? presidentFullNameController
                : vicePresidentFullNameController,
          ),

          SizedBox(height: 13),

          buildTextField(
            label: "$role's Email",
            hint: "Enter Email Address",
            controller: role == "President"
                ? presidentEmailController
                : vicePresidentEmailController,
            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: 13),

          buildTextField(
            label: "$role's CIN",
            hint: "Enter CIN",
            controller: role == "President"
                ? presidentCinController
                : vicePresidentCinController,
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 13),

          buildTextField(
            label: "$role's Phone Number",
            hint: "Enter Phone Number",
            controller: role == "President"
                ? presidentPhoneController
                : vicePresidentPhoneController,
            keyboardType: TextInputType.phone,
          ),

          SizedBox(height: 13),

          Text(
            "$role's Study Level",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8),

          DropdownButtonFormField<String>(
            // ignore: deprecated_member_use
            value: role == "President"
                ? presidentStudyLevel
                : vicePresidentStudyLevel,
            decoration: InputDecoration(
              hintText: 'Select Study Level',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF4D5DFA), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            items: [
              DropdownMenuItem(value: 'CPI1', child: Text('CPI 1')),
              DropdownMenuItem(value: 'CPI2', child: Text('CPI 2')),
              DropdownMenuItem(value: 'L1', child: Text('Bachelor 1')),
              DropdownMenuItem(value: 'L2', child: Text('Bachelor 2')),
              DropdownMenuItem(value: 'L3', child: Text('Bachelor 3')),
              DropdownMenuItem(value: 'ING1', child: Text('Engineer 1')),
              DropdownMenuItem(value: 'ING2', child: Text('Engineer 2')),
              DropdownMenuItem(value: 'ING3', child: Text('Engineer 3')),
              DropdownMenuItem(value: 'M1', child: Text('Master 1')),
              DropdownMenuItem(value: 'M2', child: Text('Master 2')),
            ],
            onChanged: (value) {
              setState(() {
                if (role == "President") {
                  presidentStudyLevel = value;
                } else {
                  vicePresidentStudyLevel = value;
                }
              });
            },
          ),

          SizedBox(height: 13),

          buildTextField(
            label: "$role's Specialization",
            hint: "Enter Specialization",
            controller: role == "President"
                ? presidentSpecializationController
                : vicePresidentSpecializationController,
          ),

          SizedBox(height: 32),

          // Complete Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  nextStep();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4D5DFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  role == "President" ? 'Next' : "Complete",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF4D5DFA), width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
