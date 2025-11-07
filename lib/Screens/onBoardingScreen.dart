import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/cornerCircles.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/SignInScreen.dart';
import 'package:maroq_ecommerce_apparels/Screens/onBoardingCarousal.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CornerCircle(
            diameter: 160,
            top: -50,
            right: -10,
            color: Color(0xFF715137).withValues(alpha: 0.2),
            strokeWidth: 1,
          ),
          CornerCircle(
            diameter: 160,
            bottom: -50,
            left: -10,
            color: Color(0xFF715137).withValues(alpha: 0.2),
            strokeWidth: 1,
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),

                  // Top image
                  Image.asset(
                    "assets/images/onboarding-top.png",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),

                  SizedBox(height: 40),

                  // Title with colored "Fashion App"
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "The "),
                        TextSpan(
                          text: "Fashion App ",
                          style: TextStyle(color: Color(0xFF715137)),
                        ),
                        TextSpan(text: "That\nMakes You Look Your Best"),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  // Subtitle
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600], height: 1.5),
                  ),

                  // Spacer pushes the button and sign-in link to bottom
                  Spacer(),

                  // Get Started button
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      isBold: false,
                      height: 50,
                      textColor: Colors.white,
                      text: "Let's Get Started",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnboardingCarousel()),
                        );
                      },
                      size: 18,
                      color: Color(0xFF715137),
                      hasIcon: false,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Sign In text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF715137),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
