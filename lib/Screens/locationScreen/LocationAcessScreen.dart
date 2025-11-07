import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/Screens/locationScreen/manualLocation.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final brown = const Color(0xFF715137);
    final double fontScale = height < 700 ? 0.9 : 1.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(color: Colors.brown.shade50, shape: BoxShape.circle),
                child: Icon(Icons.location_on_rounded, color: brown, size: 45),
              ),
              SizedBox(height: height * 0.04),
              Text(
                "What is Your Location?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 22 * fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We need to know your location in order to suggest nearby services.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14 * fontScale,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              SizedBox(height: height * 0.05),
              CustomButton(
                text: "Allow Location Access",
                hasIcon: false,
                gradient: LinearGradient(colors: [brown, const Color.fromARGB(255, 138, 93, 57)]),
                textColor: Colors.white,
                height: 48,
                press: () {
                 
                },
                size: 15 * fontScale,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManualLocationScreen()),
                  );
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  "Enter Location Manually",
                  style: GoogleFonts.poppins(
                    fontSize: 15 * fontScale,
                    color: brown,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: brown,
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
