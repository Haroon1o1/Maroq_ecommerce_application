import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomSocialButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/OtpScreen.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/SignInScreen.dart';
import 'package:maroq_ecommerce_apparels/utils/ExitHandler.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final isSmall = height < 700 || width < 360;
    final double padding = width * 0.08;
    final double spacing = isSmall ? 20 : 30;
    final double fontScale = isSmall ? 0.9 : 1.0;
    final brown = Color(0xFF715137);

    return ExitHandler(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: height * 0.06),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height * 0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 28 * fontScale,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6 * fontScale),
                  Text(
                    'Fill your information below or register with your social account.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15 * fontScale,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: spacing * 1.3),

                  // Name
                  Text(
                    'Name',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * fontScale,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextField(hintText: 'Enter Name', isPassword: false),
                  SizedBox(height: spacing * 0.6),

                  // Email
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * fontScale,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextField(hintText: 'Enter Email', isPassword: false, controller: email),
                  SizedBox(height: spacing * 0.6),

                  // Password
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * fontScale,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextField(hintText: 'Enter Password', isPassword: true),
                  SizedBox(height: spacing * 0.8),

                  // Terms & Conditions
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (val) {}, activeColor: brown),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Agree with ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13 * fontScale,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Condition',
                                style: GoogleFonts.poppins(
                                  color: brown,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: brown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing * 0.4),

                  // Sign Up Button
                  CustomButton(
                    height: isSmall ? 42 : 48,
                    gradient: LinearGradient(
                      colors: [Color(0xFF715137), Color.fromARGB(255, 138, 93, 57)],
                    ),
                    textColor: Colors.white,
                    text: "Sign Up",
                    hasIcon: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => OtpVerificationScreen(email: email.text)),
                      );
                    },
                    size: 15 * fontScale,
                  ),
                  SizedBox(height: spacing * 1.2),

                  // OR divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black54, thickness: 0.6)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or sign up with',
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: 13 * fontScale,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.black54, thickness: 0.6)),
                    ],
                  ),
                  SizedBox(height: spacing * 1.2),

                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSocialButton(icon: "assets/images/apple-logo.png", onPressed: () {}),
                      SizedBox(width: spacing * 0.6),
                      CustomSocialButton(icon: "assets/images/google-icon.png", onPressed: () {}),
                      SizedBox(width: spacing * 0.6),
                      CustomSocialButton(icon: "assets/images/facebook-logo.png", onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: spacing * 1.3),

                  // Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => SignInScreen()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                            color: brown,
                            fontSize: 14 * fontScale,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
