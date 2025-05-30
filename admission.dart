import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

// Alternative date formatting without intl package
String _formatDate(DateTime? date) {
  if (date == null) return 'Select Date';
  return '${date.day}/${date.month}/${date.year}';
}

class AppColors {
  static const Color primary = Color(0xFF2E7D32);
  static const Color secondary = Color(0xFF6A1B9A);
  static const Color accent = Color(0xFF00C853);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color background = Color(0xFFF5F7FA);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF263238);
  static const Color textSecondary = Color(0xFF607D8B);
}

class AdmissionForm extends StatefulWidget {
  @override
  _AdmissionFormState createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();
  int _currentStep = 0;
  final double _formPadding = 24.0;

  // Personal Info
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cnicController = TextEditingController();
  final _addressController = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedDob;
  String? _selectedBloodGroup;

  // Academic Info
  final _previousDegreeController = TextEditingController();
  final _previousInstituteController = TextEditingController();
  final _previousMarksController = TextEditingController();
  final _yearOfPassingController = TextEditingController();
  String? _selectedCourse;
  String? _selectedStudyMode;

  // Document Upload
  bool _termsAccepted = false;
  final Map<String, PlatformFile?> _uploadedDocuments = {
    'CNIC': null,
    'DegreeCertificate': null,
    'Transcript': null,
    'Photo': null,
    'SupportingDocs': null,
  };

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> _courses = [
    'Computer Science',
    'Electrical Engineering',
    'Mechanical Engineering',
    'Business Administration',
    'Biology',
  ];
  final List<String> _studyModes = ['Regular', 'Distance Learning', 'Evening'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cnicController.dispose();
    _addressController.dispose();
    _previousDegreeController.dispose();
    _previousInstituteController.dispose();
    _previousMarksController.dispose();
    _yearOfPassingController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(Duration(days: 365 * 15)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryDark,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryDark,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDob) {
      setState(() {
        _selectedDob = picked;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep < 2) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() => _currentStep++);
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep--);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _termsAccepted) {
      showDialog(
        context: context,
        builder: (context) => _buildConfirmationDialog(),
      );
    } else if (!_termsAccepted) {
      _showSnackBar('Please accept the terms and conditions');
    }
  }

  Future<void> _pickDocument(String documentType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _uploadedDocuments[documentType] = result.files.first;
        });
        _showSnackBar('$documentType document selected');
      }
    } on PlatformException catch (e) {
      _showSnackBar('Failed to pick file: ${e.message}');
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  Future<void> _pickImage(String documentType) async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _uploadedDocuments[documentType] = PlatformFile(
            name: image.name,
            size: 202400,
            path: image.path,
          );
        });
        _showSnackBar('$documentType image selected');
      }
    } on PlatformException catch (e) {
      _showSnackBar('Failed to pick image: ${e.message}');
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  Widget _buildConfirmationDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.primary, size: 60),
            SizedBox(height: 16),
            Text(
              'Application Submitted!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your application has been successfully submitted. We will contact you soon.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      margin: EdgeInsets.only(bottom: _formPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: _currentStep == index ? 24 : 16,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
                  _currentStep == index
                      ? AppColors.primaryDark
                      : Colors.grey[300],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Personal Information'),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _nameController,
            label: 'Full Name',
            icon: Icons.person_outline,
            validator: (value) => value!.isEmpty ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _emailController,
            label: 'Email Address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator:
                (value) => !value!.contains('@') ? 'Invalid email' : null,
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _phoneController,
            label: 'Phone Number',
            icon: Icons.phone_android_outlined,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator:
                (value) => value!.length < 10 ? 'Invalid phone number' : null,
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _cnicController,
            label: 'CNIC (Without dashes)',
            icon: Icons.credit_card_outlined,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator:
                (value) =>
                    value!.length != 13 ? 'CNIC must be 13 digits' : null,
          ),
          SizedBox(height: 16),
          _buildDatePickerField(),
          SizedBox(height: 16),
          _buildDropdownFormField(
            value: _selectedGender,
            items: _genders,
            label: 'Gender',
            icon: Icons.transgender,
            onChanged: (value) => setState(() => _selectedGender = value),
            validator: (value) => value == null ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          _buildDropdownFormField(
            value: _selectedBloodGroup,
            items: _bloodGroups,
            label: 'Blood Group (Optional)',
            icon: Icons.bloodtype_outlined,
            onChanged: (value) => setState(() => _selectedBloodGroup = value),
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _addressController,
            label: 'Address',
            icon: Icons.home_outlined,
            maxLines: 3,
            validator: (value) => value!.isEmpty ? 'Required field' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicInfoStep() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Academic Information'),
          SizedBox(height: 16),
          _buildDropdownFormField(
            value: _selectedCourse,
            items: _courses,
            label: 'Select Course',
            icon: Icons.menu_book_outlined,
            onChanged: (value) => setState(() => _selectedCourse = value),
            validator: (value) => value == null ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          _buildDropdownFormField(
            value: _selectedStudyMode,
            items: _studyModes,
            label: 'Study Mode',
            icon: Icons.schedule_outlined,
            onChanged: (value) => setState(() => _selectedStudyMode = value),
            validator: (value) => value == null ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _previousDegreeController,
            label: 'Previous Degree',
            icon: Icons.school_outlined,
            validator: (value) => value!.isEmpty ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          _buildTextFormField(
            controller: _previousInstituteController,
            label: 'Previous Institute',
            icon: Icons.account_balance_outlined,
            validator: (value) => value!.isEmpty ? 'Required field' : null,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildTextFormField(
                  controller: _previousMarksController,
                  label: 'Marks/GPA',
                  icon: Icons.grade_outlined,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return 'Required field';
                    final marks = double.tryParse(value);
                    if (marks == null || marks < 0 || marks > 100) {
                      return 'Invalid percentage';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildTextFormField(
                  controller: _yearOfPassingController,
                  label: 'Year',
                  icon: Icons.calendar_today_outlined,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) return 'Required field';
                    final year = int.tryParse(value);
                    if (year == null ||
                        year < 1900 ||
                        year > DateTime.now().year) {
                      return 'Invalid year';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsStep() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Required Documents'),
          SizedBox(height: 16),
          Text(
            'Please upload clear scans/photos of the following documents (optional but recommended):',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          SizedBox(height: 24),
          _buildDocumentUploadCard(
            title: 'CNIC/B-Form',
            description: 'Front and back side',
            required: true,
            documentType: 'CNIC',
          ),
          SizedBox(height: 16),
          _buildDocumentUploadCard(
            title: 'Previous Degree Certificate',
            description: 'Attested copy',
            required: true,
            documentType: 'DegreeCertificate',
          ),
          SizedBox(height: 16),
          _buildDocumentUploadCard(
            title: 'Transcript/Mark Sheet',
            description: 'Latest transcript',
            required: true,
            documentType: 'Transcript',
          ),
          SizedBox(height: 16),
          _buildDocumentUploadCard(
            title: 'Passport Size Photo',
            description: 'White background',
            required: true,
            documentType: 'Photo',
            isImage: true,
          ),
          SizedBox(height: 16),
          _buildDocumentUploadCard(
            title: 'Other Supporting Documents',
            description: 'Optional (e.g. experience letters)',
            required: false,
            documentType: 'SupportingDocs',
          ),
          SizedBox(height: 24),
          _buildTermsCheckbox(),
        ],
      ),
    );
  }

  Widget _buildDocumentUploadCard({
    required String title,
    required String description,
    required bool required,
    required String documentType,
    bool isImage = false,
  }) {
    final uploadedFile = _uploadedDocuments[documentType];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isImage
                        ? Icons.camera_alt_outlined
                        : Icons.description_outlined,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(
                    required ? 'REQUIRED' : 'OPTIONAL',
                    style: TextStyle(
                      fontSize: 10,
                      color: required ? Colors.white : AppColors.textSecondary,
                    ),
                  ),
                  backgroundColor:
                      required ? AppColors.primary : Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (uploadedFile != null) ...[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[100]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        uploadedFile.name,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[800],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, size: 18),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          _uploadedDocuments[documentType] = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed:
                    () =>
                        isImage
                            ? _pickImage(documentType)
                            : _pickDocument(documentType),
                icon: Icon(Icons.upload_outlined, size: 20),
                label: Text(
                  uploadedFile == null ? 'Upload Document' : 'Replace Document',
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: AppColors.primaryDark),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(icon, color: AppColors.primaryDark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
        ),
        filled: true,
        fillColor: AppColors.card,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(color: AppColors.textPrimary),
    );
  }

  Widget _buildDropdownFormField({
    required String? value,
    required List<String> items,
    required String label,
    required IconData icon,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(icon, color: AppColors.primaryDark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
        ),
        filled: true,
        fillColor: AppColors.card,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      items:
          items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: AppColors.textPrimary),
              ),
            );
          }).toList(),
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(color: AppColors.textPrimary),
      dropdownColor: AppColors.card,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryDark),
      hint: Text(
        'Select ${label.toLowerCase()}',
        style: TextStyle(color: Colors.grey[500]),
      ),
    );
  }

  Widget _buildDatePickerField() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          labelStyle: TextStyle(color: AppColors.textSecondary),
          prefixIcon: Icon(
            Icons.calendar_today_outlined,
            color: AppColors.primaryDark,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
          ),
          filled: true,
          fillColor: AppColors.card,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
        child: Row(
          children: [
            Text(
              _selectedDob == null ? 'Select Date' : _formatDate(_selectedDob),
              style: TextStyle(
                fontSize: 16,
                color:
                    _selectedDob == null
                        ? Colors.grey[500]
                        : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Column(
      children: [
        Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: _termsAccepted,
                onChanged:
                    (value) => setState(() => _termsAccepted = value ?? false),
                activeColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'I certify that all information provided is accurate and complete. I agree to the ',
                    ),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' of COMSATS University.'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousStep,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: AppColors.primaryDark),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'BACK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ),
          if (_currentStep > 0) SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _currentStep < 2 ? _nextStep : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
              ),
              child: Text(
                _currentStep < 2 ? 'NEXT' : 'SUBMIT APPLICATION',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Admission Form', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_formPadding),
            child: Column(
              children: [
                _buildStepIndicator(),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildPersonalInfoStep(),
                      _buildAcademicInfoStep(),
                      _buildDocumentsStep(),
                    ],
                  ),
                ),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
