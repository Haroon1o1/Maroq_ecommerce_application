import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomSocialButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/SignUpScreen.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/forgetPasswordScreen.dart';
import 'package:maroq_ecommerce_apparels/navBar/mainNavBar.dart';
import 'package:maroq_ecommerce_apparels/utils/ExitHandler.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    // Responsiveness factors
    final isSmall = height < 700 || width < 360;
    final double padding = width * 0.08; // proportional horizontal padding
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
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 28 * fontScale,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6 * fontScale),
                  Text(
                    'Hi! Welcome back, you\'ve been missed',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15 * fontScale,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: spacing * 1.3),

                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * fontScale,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextField(hintText: 'Enter Email', isPassword: false),
                  SizedBox(height: spacing * 0.6),

                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * fontScale,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextField(hintText: 'Enter Password', isPassword: true),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ForgetPasswordScreen()),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: brown,
                          fontSize: 13 * fontScale,
                          decoration: TextDecoration.underline,
                          decorationColor: brown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing * 0.4),

                  CustomButton(
                    height: isSmall ? 42 : 48,
                    gradient: LinearGradient(
                      colors: [Color(0xFF715137), Color.fromARGB(255, 138, 93, 57)],
                    ),
                    textColor: Colors.white,
                    text: "Sign In",
                    hasIcon: false,
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavBar()),
                      );
                    },
                    size: 15 * fontScale,
                  ),
                  SizedBox(height: spacing * 1.2),

                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black54, thickness: 0.6)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or sign in with',
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          'Sign Up',
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
