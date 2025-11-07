import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';
import 'package:maroq_ecommerce_apparels/navBar/mainNavBar.dart';

class CompleteProfileScreen extends StatefulWidget {
  CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedGender;
  File? _profileImage;

  final brown = Color(0xFF715137);
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
    Navigator.pop(context);
  }

  void _showImagePickerSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Wrap(
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 40,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.camera_alt_outlined, size: 20, color: Color(0xFF715137)),
                title: Text(style: GoogleFonts.poppins(fontSize: 14), "Take Photo"),
                onTap: () => _pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: Icon(Icons.photo_library_outlined, size: 20, color: Color(0xFF715137)),
                title: Text(style: GoogleFonts.poppins(fontSize: 14), "Choose from Gallery"),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _completeProfile() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Profile Completed Successfully!")));
    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavBar())
                      );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final isSmall = height < 700 || width < 360;
    final double spacing = isSmall ? 20 : 30;
    final double fontScale = isSmall ? 0.9 : 1.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Complete Your Profile",
          style: GoogleFonts.poppins(fontSize: 18 * fontScale, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),

            SizedBox(height: 8),
            Text(
              "Don't worry, only you can see your personal data. No one else will be able to see it.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.grey.shade600),
            ),
            SizedBox(height: spacing * 1.2),

            // Profile image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, color: Colors.grey, size: 60)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: GestureDetector(
                    onTap: _showImagePickerSheet,
                    child: CircleAvatar(
                      backgroundColor: brown,
                      radius: 16,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing * 1.5),

            CustomTextField(hintText: "Enter your name", controller: _nameController),

            SizedBox(height: spacing),

            // Phone Number
            CustomTextField(
              hintText: "Enter your name",
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: spacing),

            // Gender Dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGenderOption('Male'),
                _buildGenderOption('Female'),
                _buildGenderOption('Other'),
              ],
            ),

            SizedBox(height: spacing * 1.5),

            // Button
            CustomButton(
              height: isSmall ? 42 : 48,
              gradient: LinearGradient(colors: [brown, Color.fromARGB(255, 138, 93, 57)]),
              textColor: Colors.white,
              text: "Complete Profile",
              hasIcon: false,
              press: _completeProfile,
              size: 15 * fontScale,
            ),
            SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    final bool isSelected = _selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedGender = gender),
        child: Container(
          margin: EdgeInsets.only(right: 4),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF715137) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Color(0xFF715137) : Colors.grey.shade300,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isSelected ? Colors.white : Color(0xFF715137),
            ),
          ),
        ),
      ),
    );
  }
}
