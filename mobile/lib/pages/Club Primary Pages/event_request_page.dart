import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventRequestPage extends StatefulWidget {
  const EventRequestPage({super.key});

  static String routeName = "EventRequestPage";

  @override
  State<EventRequestPage> createState() => _EventRequestPageState();
}

class _EventRequestPageState extends State<EventRequestPage> {
  // FormKey allows us to access and control the from's state (like validating or saving input)
  final formKey = GlobalKey<FormState>();
  int currentStep = 0;

  // Form Controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController expectedStudentsController =
      TextEditingController();
  final TextEditingController externalAddressController =
      TextEditingController();

  // Form Values
  String? requestedByLeader;
  String? selectedEventType;
  DateTime? startDateTime;
  DateTime? endDateTime;
  String? selectedRoomId;
  bool isExternalLocation = false;

  // Event Types
  final List<Map<String, dynamic>> eventTypes = [
    {'value': 'Scientific', 'icon': Icons.science, 'color': Colors.blue},
    {'value': 'Social', 'icon': Icons.group, 'color': Colors.purple},
    {
      'value': 'Entertainment',
      'icon': Icons.movie_filter,
      'color': Colors.orange,
    },
    {'value': 'National', 'icon': Icons.account_balance, 'color': Colors.teal},
    {'value': 'Sports', 'icon': Icons.sports_soccer, 'color': Colors.green},
    {'value': 'Artistic', 'icon': Icons.brush, 'color': Colors.pink},
    {'value': 'Other', 'icon': Icons.category_outlined, 'color': Colors.red},
  ];

  // Rooms
  final List<Map<String, String>> availableRooms = [
    {'id': '1', 'name': 'Amphi Kanoun'},
    {'id': '2', 'name': 'Amphi B'},
    {'id': '3', 'name': 'A-23'},
    {'id': '4', 'name': 'C-11'},
    {'id': '5', 'name': 'B-25'},
    {'id': '6', 'name': 'A-12'},
    {'id': '7', 'name': 'A-21'},
    {'id': '8', 'name': 'C-01'},
    {'id': '9', 'name': 'C-18'},
  ];

  // Annexes
  final List<Map<String, dynamic>> annexTemplates = [
    {
      'id': '1',
      'number': 1,
      'title': 'Budget Breakdown Document',
      'template_url': 'https://example.com/annex1.pdf',
      'required': true,
      'uploaded': false,
      'file_url': null,
    },
    {
      'id': '2',
      'number': 2,
      'title': 'Safety Protocol Agreement',
      'template_url': 'https://example.com/annex2.pdf',
      'required': true,
      'uploaded': false,
      'file_url': null,
    },
    {
      'id': '3',
      'number': 3,
      'title': 'Needed Equipment Document ',
      'template_url': 'https://example.com/annex3.pdf',
      'required': true,
      'uploaded': false,
      'file_url': null,
    },
    {
      'id': '4',
      'number': 4,
      'title': 'Equipment Request Form',
      'template_url': 'https://example.com/annex4.pdf',
      'required': false,
      'uploaded': false,
      'file_url': null,
    },
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    expectedStudentsController.dispose();
    externalAddressController.dispose();
    super.dispose();
  }

  Future<void> pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        annexTemplates[index]['uploaded'] = true;
        annexTemplates[index]['file_url'] = result.files.single.path;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('${result.files.single.name} uploaded successfully'),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  void downloadTemplate(String url) {
    // TODO: Implement actual download functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.download, color: Colors.white),
            SizedBox(width: 12),
            Text('Downloading template...'),
          ],
        ),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> selectDateTime(bool isStart) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 7)),
      firstDate: DateTime.now().add(const Duration(days: 7)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.amber,
              onPrimary: Colors.black,
              surface: Color(0xFF0A1A3A),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.amber,
                onPrimary: Colors.black,
                surface: Color(0xFF0A1A3A),
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        setState(() {
          final dateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          if (isStart) {
            startDateTime = dateTime;
          } else {
            endDateTime = dateTime;
          }
        });
      }
    }
  }

  bool validateCurrentStep() {
    if (currentStep == 0) {
      return formKey.currentState?.validate() ?? false;
    } else if (currentStep == 1) {
      final requiredAnnexes = annexTemplates.where(
        (a) => a['required'] == true,
      );
      return requiredAnnexes.every((a) => a['uploaded'] == true);
    }
    return true;
  }

  void submitRequest() {
    // TODO: Submit to backend!
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0A1A3A),
                const Color(0xFF001799).withValues(alpha: 0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.green.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Request Submitted!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your event request has been submitted successfully. You will be notified once it\'s reviewed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011029),
      appBar: AppBar(
        backgroundColor: Color(0xFF001799),
        title: Text(
          'Request Event',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Stepper
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF001799), Color(0xFF011029)],
              ),
            ),
            child: Row(
              children: [
                buildStepIndicator(0, 'Event Details', Icons.event_note),
                buildStepLine(0),
                buildStepIndicator(1, 'Annexes', Icons.attach_file),
                buildStepLine(1),
                buildStepIndicator(2, 'Review', Icons.check_circle),
              ],
            ),
          ),

          // Content
          Expanded(
            child: IndexedStack(
              index: currentStep,
              children: [
                buildEventDetailsStep(),
                buildAnnexesStep(),
                buildReviewStep(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStepIndicator(int step, String label, IconData icon) {
    final isActive = currentStep == step;
    final isCompleted = currentStep > step;

    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: isCompleted || isActive
                ? LinearGradient(colors: [Colors.amber, Colors.orange.shade600])
                : null,
            color: isCompleted || isActive ? null : Colors.grey[800],
            shape: BoxShape.circle,
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.5),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ]
                : null,
          ),
          child: Icon(
            isCompleted ? Icons.check : icon,
            color: isCompleted || isActive ? Colors.black : Colors.grey[600],
            size: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.amber : Colors.grey[500],
            fontSize: 11,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget buildStepLine(int step) {
    final isCompleted = currentStep > step;
    return Expanded(
      child: Container(
        height: 2,
        margin: EdgeInsets.only(bottom: 30, left: 8, right: 8),
        decoration: BoxDecoration(
          gradient: isCompleted
              ? LinearGradient(colors: [Colors.amber, Colors.orange.shade600])
              : null,
          color: isCompleted ? null : Colors.grey[800],
        ),
      ),
    );
  }

  Widget buildEventDetailsStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionHeader('Event Information', Icons.info_outline),
            SizedBox(height: 16),

            // TODO: Add Radio Button for leader

            // Title Field
            buildTextField(
              controller: titleController,
              label: 'Event Title',
              hint: 'e.g., Web Development Workshop',
              icon: Icons.title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ('Please enter event title');
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Description Field
            buildTextField(
              controller: descriptionController,
              label: 'Description',
              hint: 'Describe your event...',
              icon: Icons.description,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ('Please enter event description');
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            // Event Type
            Text(
              'Event Type',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: eventTypes.map((type) {
                final isSelected = selectedEventType == type['value'];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedEventType = type['value'];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                type['color'],
                                type['color'].withValues(alpha: 0.7),
                              ],
                            )
                          : null,
                      color: isSelected ? null : Color(0xFF0A1A3A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? type['color']
                            : Colors.white.withValues(alpha: 0.1),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          type['icon'],
                          color: isSelected ? Colors.white : type['color'],
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          type['value'],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[400],
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            buildSectionHeader('Date & Time', Icons.schedule),
            SizedBox(height: 16),

            // Start Date Time
            buildDateTimeField(
              label: 'Start Date & Time',
              dateTime: startDateTime,
              onTap: () => selectDateTime(true),
            ),
            SizedBox(height: 16),

            // End Date Time
            buildDateTimeField(
              label: 'End Date & Time',
              dateTime: endDateTime,
              onTap: () => selectDateTime(false),
            ),

            SizedBox(height: 24),

            buildSectionHeader('Location & Capacity', Icons.place),
            SizedBox(height: 16),

            // Location Type Switch
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isExternalLocation = false;
                        selectedRoomId = null;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: !isExternalLocation
                            ? LinearGradient(
                                colors: [Colors.amber, Colors.orange.shade600],
                              )
                            : null,
                        color: !isExternalLocation
                            ? null
                            : const Color(0xFF0A1A3A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: !isExternalLocation
                              ? Colors.amber
                              : Colors.white.withValues(alpha: 0.1),
                          width: !isExternalLocation ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.meeting_room,
                            color: !isExternalLocation
                                ? Colors.black
                                : Colors.grey[500],
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Institute Room',
                            style: TextStyle(
                              color: !isExternalLocation
                                  ? Colors.black
                                  : Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isExternalLocation = true;
                        externalAddressController.clear();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: isExternalLocation
                            ? LinearGradient(
                                colors: [Colors.amber, Colors.orange.shade600],
                              )
                            : null,
                        color: isExternalLocation
                            ? null
                            : const Color(0xFF0A1A3A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isExternalLocation
                              ? Colors.amber
                              : Colors.white.withValues(alpha: 0.1),
                          width: isExternalLocation ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: isExternalLocation
                                ? Colors.black
                                : Colors.grey[500],
                          ),
                          SizedBox(width: 8),
                          Text(
                            'External',
                            style: TextStyle(
                              color: isExternalLocation
                                  ? Colors.black
                                  : Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Room Dropdown or External Address
            if (!isExternalLocation)
              buildDropdownField(
                label: 'Select Room',
                hint: 'Choose a room',
                icon: Icons.meeting_room,
                value: selectedRoomId,
                items: availableRooms,
                onChanged: (value) {
                  setState(() {
                    selectedRoomId = value;
                  });
                },
              )
            else
              buildTextField(
                controller: externalAddressController,
                label: 'External Address',
                hint: 'Enter the full address',
                icon: Icons.location_on,
                validator: (value) {
                  if (isExternalLocation && (value == null || value.isEmpty)) {
                    return ('Please enter external address');
                  }
                  return null;
                },
              ),
            SizedBox(height: 16),

            // Expected Students
            buildTextField(
              controller: expectedStudentsController,
              label: 'Expected Number of Students',
              hint: 'e.g., 50',
              icon: Icons.people,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter expected number of students';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),

            SizedBox(height: 40),

            // Button
            buildNavigationButton(),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildAnnexesStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('Required Documents', Icons.attach_file),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.blue.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Download each template, fill it out, and upload the completed document',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Annexes List
          ...annexTemplates.asMap().entries.map((entry) {
            final index = entry.key;
            final annex = entry.value;
            return buildAnnexCard(annex, index);
          }),

          SizedBox(height: 40),

          // Button
          buildNavigationButton(),

          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildReviewStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('Review Your Request', Icons.preview),
          SizedBox(height: 20),

          // Event Details Summary
          buildReviewCard('Event Details', Icons.event, [
            {'label': 'Title', 'value': titleController.text},
            {'label': 'Type', 'value': selectedEventType ?? 'Not selected'},
            {'label': 'Description', 'value': descriptionController.text},
          ]),
          SizedBox(height: 16),

          // Date & Time Summary
          buildReviewCard('Date & Time', Icons.schedule, [
            {
              'label': 'Start',
              'value': startDateTime != null
                  ? DateFormat('MMM dd, yyyy - hh:mm a').format(startDateTime!)
                  : 'Not selected',
            },
            {
              'label': 'End',
              'value': endDateTime != null
                  ? DateFormat('MMM dd, yyyy - hh:mm a').format(endDateTime!)
                  : 'Not selected',
            },
          ]),
          SizedBox(height: 16),

          // Location Summary
          buildReviewCard('Location', Icons.place, [
            {
              'label': 'Type',
              'value': isExternalLocation ? 'External Location' : 'Campus Room',
            },
            {
              'label': 'Location',
              'value': isExternalLocation
                  ? externalAddressController.text
                  : availableRooms.firstWhere(
                      (r) => r['id'] == selectedRoomId,
                      orElse: () => {'name': 'Not selected'},
                    )['name']!,
            },
            {
              'label': 'Expected Students',
              'value': expectedStudentsController.text,
            },
          ]),

          SizedBox(height: 16),

          // Annexes Summary
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0A1A3A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.attach_file,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Uploaded Annexes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ...annexTemplates
                    .where((a) => a['uploaded'] == true)
                    .map(
                      (a) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                a['title'],
                                style: TextStyle(color: Colors.grey[300]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
          SizedBox(height: 40),

          // Button
          buildNavigationButton(),

          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.orange.shade600],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(icon, color: Colors.amber),
            filled: true,
            fillColor: const Color(0xFF0A1A3A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.amber, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateTimeField({
    required String label,
    required DateTime? dateTime,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0A1A3A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.amber),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    dateTime != null
                        ? DateFormat('MMM dd, yyyy - hh:mm a').format(dateTime)
                        : 'Select date and time',
                    style: TextStyle(
                      color: dateTime != null ? Colors.white : Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField({
    required String label,
    required String hint,
    required IconData icon,
    required String? value,
    required List<Map<String, String>> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0A1A3A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.amber),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    hint: Text(hint, style: TextStyle(color: Colors.grey[600])),
                    isExpanded: true,
                    dropdownColor: const Color(0xFF0A1A3A),
                    style: const TextStyle(color: Colors.white),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item['id'],
                        child: Text(
                          '${item['name']}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAnnexCard(Map<String, dynamic> annex, int index) {
    final isRequired = annex['required'];
    final isUploaded = annex['uploaded'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1A3A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUploaded
              ? Colors.green.withValues(alpha: 0.5)
              : isRequired
              ? Colors.amber.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.1),
          width: isUploaded ? 2 : 1,
        ),
        boxShadow: isUploaded
            ? [
                BoxShadow(
                  color: Colors.green.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isUploaded
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  isUploaded ? Icons.check_circle : Icons.description,
                  color: isUploaded ? Colors.green : Colors.amber,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Annex ${annex['number']}',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (isRequired)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Required',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      annex['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => downloadTemplate(annex['template_url']),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Colors.blue.withValues(alpha: 0.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(
                    Icons.download,
                    color: Colors.blue,
                    size: 20,
                  ),
                  label: const Text(
                    'Download',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => pickFile(index),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: isUploaded ? Colors.green : Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(isUploaded ? Icons.check : Icons.upload, size: 20),
                  label: Text(isUploaded ? 'Uploaded' : 'Upload'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildReviewCard(
    String title,
    IconData icon,
    List<Map<String, String>> items,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1A3A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.amber, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      item['label']!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item['value']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigationButton() {
    return Row(
      children: [
        if (currentStep > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  currentStep--;
                });
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.amber, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        if (currentStep > 0) SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {
              if (currentStep < 2) {
                if (validateCurrentStep()) {
                  setState(() {
                    currentStep++;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please complete all required fields'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }
              } else {
                submitRequest();
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              elevation: 4,
              shadowColor: Colors.amber.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              currentStep < 2 ? 'Continue' : 'Submit Request',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
