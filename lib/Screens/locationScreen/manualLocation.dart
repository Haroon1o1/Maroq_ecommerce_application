import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';

class ManualLocationScreen extends StatelessWidget {
  const ManualLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final brown = const Color(0xFF715137);
    final double fontScale = height < 700 ? 0.9 : 1.0;
    final double padding = width * 0.08;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Enter Location Manually",
          style: GoogleFonts.poppins(
            fontSize: 16 * fontScale,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                "Please fill in your location details below.",
                style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 35),

              // Country Field
              CustomTextField(label: "Country", hintText: "Enter Country"),
              const SizedBox(height: 20),

              // State Field
              CustomTextField(label: "State / Province", hintText: "Enter State or Province"),
              const SizedBox(height: 20),

              // City Field
              CustomTextField(label: "City", hintText: "Enter City"),
              const SizedBox(height: 20),

              // Area Field
              CustomTextField(label: "Area / Street", hintText: "Enter Area or Street"),
              const SizedBox(height: 40),

              // Save Button
              CustomButton(
                text: "Save Location",
                hasIcon: false,
                gradient: LinearGradient(colors: [brown, const Color.fromARGB(255, 138, 93, 57)]),
                textColor: Colors.white,
                height: 48,
                press: () {
                  // TODO: Save location logic
                },
                size: 15 * fontScale,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
