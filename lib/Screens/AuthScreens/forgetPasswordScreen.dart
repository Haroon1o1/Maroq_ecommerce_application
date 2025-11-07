import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomDialogue.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomDialog(
          headline: "Missing Email",
          subline: "Please enter your email address to reset your password.",
          redButton: "Okay",
          greenButton: "",
          red: () => Navigator.pop(context),
          green: () {},
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API call or Firebase reset
    Future.delayed(Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      showDialog(
        context: context,
        builder: (_) => CustomDialog(
          headline: "Email Sent",
          subline: "We’ve sent a password reset link to your email. Check your inbox!",
          redButton: "Done",
          greenButton: "",
          red: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          green: () {},
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(style: GoogleFonts.poppins(fontSize: 16), "Forgot Password"),
        backgroundColor: Color(0xFF715137),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Reset your password",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              "Enter your registered email address and we’ll send you a password reset link.",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            CustomTextField(hintText: "Enter your email", controller: _emailController),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _isLoading ? null : _resetPassword,
              child: CustomButton(
                height: 50,
                textColor: Colors.white,
                text: "Send reset link",
                press: () {},
                size: 14,
                isBold: false,
                hasIcon: false,
                gradient: const LinearGradient(
                  colors: [Color(0xFF715137), Color.fromARGB(255, 138, 93, 57)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
