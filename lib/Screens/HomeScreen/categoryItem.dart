import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String icon;
  CategoryItem({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Color(0xFFF8F2ED),
          child: Image.asset(icon, color: Color(0xFF715137), width: 30),
        ),
        SizedBox(height: 6),
        Text(name, style: GoogleFonts.poppins()),
      ],
    );
  }
}
