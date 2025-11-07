import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomDialogue.dart';

class ExitHandler extends StatelessWidget {
  final Widget child;

  const ExitHandler({super.key, required this.child});

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          headline: "Exit App?",
          subline: "Are you sure you want to close the app?",
          redButton: "Exit",
          greenButton: "Cancel",
          red: () {
            exit(0);
          },
          green: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevents default pop until we handle it
      onPopInvoked: (didPop) {
        if (!didPop) {
          _showExitDialog(context);
        }
      },
      child: child,
    );
  }
}
