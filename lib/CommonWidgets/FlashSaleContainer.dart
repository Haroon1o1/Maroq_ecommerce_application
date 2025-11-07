import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashSaleContainer extends StatelessWidget {
  const FlashSaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Flash Sale",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Text("Closing in : ", style: GoogleFonts.poppins(color: Colors.white)),
              Text("02 : 12 : 56", style: GoogleFonts.poppins(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
