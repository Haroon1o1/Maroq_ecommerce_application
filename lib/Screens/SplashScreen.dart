import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/cornerCircles.dart';
import 'package:maroq_ecommerce_apparels/Screens/onBoardingScreen.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds, then navigate
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top right circle
          const CornerCircle(
            diameter: 160,
            top: -50,
            right: -10,
            color: Color(0xFF715137),
            strokeWidth: 1,
          ),

          // Bottom left circle
          const CornerCircle(
            diameter: 180,
            bottom: -80,
            left: -50,
            color: Color(0xFF715137),
            strokeWidth: 1,
          ),

          // Center logo and loader
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/text-logo.png", width: 200),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Color(0xFF715137),
                    strokeWidth: 1.2,
                    trackGap: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
