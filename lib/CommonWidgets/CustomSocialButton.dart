import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const CustomSocialButton({required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Ink(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
        ),
        child: Center(child: Image.asset(icon, width: 26, height: 26, fit: BoxFit.contain)),
      ),
    );
  }
}
