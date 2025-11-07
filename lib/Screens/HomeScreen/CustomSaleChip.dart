import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleChip extends StatelessWidget {
  final String title;
  final bool selected;

  SaleChip({super.key, required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
