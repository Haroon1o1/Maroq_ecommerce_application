import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String headline, subline, redButton, greenButton;
  final VoidCallback red, green;
  final bool isInfo, isEditable;
  final TextEditingController? controller;

  const CustomDialog({
    super.key,
    this.isEditable = false,
    this.isInfo = false,
    this.controller,
    required this.headline,
    required this.subline,
    required this.red,
    required this.green,
    required this.redButton,
    required this.greenButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                headline,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                subline,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (greenButton.isNotEmpty)
                    Expanded(
                      child: GestureDetector(
                        onTap: green,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF715137), Color.fromARGB(255, 138, 93, 57)],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            greenButton,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  if (greenButton.isNotEmpty && redButton.isNotEmpty) const SizedBox(width: 10),
                  if (redButton.isNotEmpty)
                    Expanded(
                      child: GestureDetector(
                        onTap: red,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            redButton,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
