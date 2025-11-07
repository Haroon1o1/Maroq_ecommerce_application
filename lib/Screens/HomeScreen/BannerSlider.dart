import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'CustomBanner.dart';

class BannerSlider extends StatefulWidget {
  List<Map<String, String>> banners = [];
   BannerSlider({super.key, required this.banners});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _controller = PageController();
  int _currentIndex = 0;



  @override
  void initState() {
    super.initState();
    // Auto-slide every 4 seconds
    Future.delayed(const Duration(seconds: 4), autoSlide);
  }

  void autoSlide() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 4));
      int nextPage = (_currentIndex + 1) % widget.banners.length;
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() => _currentIndex = nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.45,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final b = widget.banners[index];
              return CustomBanner(
                heading: b['heading']!,
                subHeading: b['subHeading']!,
                buttonText: b['buttonText']!,
                bgImage: b['bgImage']!,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.banners.length,
          effect: ExpandingDotsEffect(
            activeDotColor: const Color(0xFF715137),
            dotColor: Colors.grey.shade300,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 6,
          ),
        ),
      ],
    );
  }
}
