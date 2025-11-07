import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';

class CustomBanner extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String buttonText;
  final String bgImage;

  CustomBanner({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.buttonText,
    required this.bgImage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: width * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withValues(alpha: 0.05),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: GoogleFonts.poppins(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            SizedBox(
              width: width * 0.5,
              child: Text(
                subHeading,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontSize: width * 0.035,
                ),
                softWrap: true,
              ),
            ),
            Spacer(), // pushes the button to bottom
            SizedBox(
              width: 150,
              child: CustomButton(
                height: 40,
                textColor: Colors.white,
                text: buttonText,
                press: () {},
                size: 14,
                hasIcon: false,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
