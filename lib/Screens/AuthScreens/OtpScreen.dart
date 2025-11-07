import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/Screens/CompleteProfileScreen/completeProfileScreen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final brown = const Color(0xFF715137);

  void _verifyOtp() {
    String otp = _controllers.map((e) => e.text).join();
    if (otp.length < 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter complete code")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompleteProfileScreen()),
      );
      return;
    }
    // TODO: add API logic here
  }

  void _resendCode() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP resent successfully")));
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.02),
            Text(
              "Verify Code",
              style: GoogleFonts.poppins(
                fontSize: 26 * fontScale,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter the code we just sent to email",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.grey.shade600),
            ),
            Text(
              widget.email,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14 * fontScale,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: spacing * 1.5),

            // OTP fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  width: 55,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 20 * fontScale, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: brown, width: 1.5),
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (val.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing * 1.2),

            Text(
              "Didn't receive OTP?",
              style: GoogleFonts.poppins(fontSize: 14 * fontScale, color: Colors.grey.shade600),
            ),
            TextButton(
              onPressed: _resendCode,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                "Resend code",
                style: GoogleFonts.poppins(
                  fontSize: 14 * fontScale,
                  color: brown,
                  decoration: TextDecoration.underline,
                  decorationColor: brown,
                ),
              ),
            ),

            SizedBox(height: spacing * 1.8),
            CustomButton(
              height: isSmall ? 42 : 48,
              gradient: LinearGradient(colors: [brown, const Color.fromARGB(255, 138, 93, 57)]),
              textColor: Colors.white,
              text: "Verify",
              hasIcon: false,
              press: _verifyOtp,
              size: 15 * fontScale,
            ),
          ],
        ),
      ),
    );
  }
}
