import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/Screens/AuthScreens/SignInScreen.dart';

class OnboardingCarousel extends StatefulWidget {
  OnboardingCarousel({super.key});

  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "image": "assets/images/onboarding-carosal.png",
      "highlight": "Seamless",
      "title": "Shopping Experience",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
    },
    {
      "image": "assets/images/onboarding-carosal.png",
      "highlight": "Wishlist:",
      "title": " Where Fashion Dreams Begin",
      "subtitle": "Save your favorite looks and build your personalized fashion wishlist.",
    },
    {
      "image": "assets/images/onboarding-carosal.png",
      "highlight": "Fast & Secure",
      "title": " Checkout",
      "subtitle": "Enjoy seamless shopping with quick payments and easy delivery tracking.",
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// --- Skip Button
            Positioned(
              top: 15,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF715137),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            /// --- PageView
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              physics: NeverScrollableScrollPhysics(), // 👈 disables finger swipe
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final page = _pages[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),

                    // Image mockup - slightly smaller now
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          page["image"],
                          width: size.width * 0.65, // 🔹 slightly smaller
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // keep visual balance
                    SizedBox(height: size.height * 0.0),
                  ],
                );
              },
            ),

            /// --- Bottom rounded sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.30,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, -3)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// --- Text (animated)
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                      child: Column(
                        key: ValueKey(_currentPage),
                        children: [
                          // Title
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(
                                  text: _pages[_currentPage]["highlight"],
                                  style: TextStyle(color: Color(0xFF715137)),
                                ),
                                TextSpan(text: _pages[_currentPage]["title"]),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          // Subtitle
                          Text(
                            _pages[_currentPage]["subtitle"],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// --- Indicators + Next button (static, not animated)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (dotIndex) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? Color(0xFF715137)
                                    : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),

                        GestureDetector(
                          onTap: _nextPage,
                          child: Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFF715137),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
