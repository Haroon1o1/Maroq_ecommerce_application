import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/HomeScreen.dart';
import 'package:maroq_ecommerce_apparels/Screens/SettingsScreens/settings.dart';
import 'package:maroq_ecommerce_apparels/Screens/allProductsScreen/allProducts.dart';
import 'package:maroq_ecommerce_apparels/Screens/chatScreens/chatList.dart';
import 'package:maroq_ecommerce_apparels/utils/ExitHandler.dart';

class MainNavBar extends StatefulWidget {
  MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(), // your main home UI
    ChatListScreen(),
    AllProductsScreen(),

    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ExitHandler(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(index: currentIndex, children: screens),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          icons: [
            'assets/images/home-icon.png',
            'assets/images/chat-icon.png',
            'assets/images/bag-icon.png',
            'assets/images/profile-icon.png',
          ],
        ),
      ),
    );
  }
}

// ✅ Your Custom Bottom Navigation Bar
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> icons;

  CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFF0F0F13),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              final isSelected = index == currentIndex;

              return GestureDetector(
                onTap: () => onTap(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    icons[index],
                    width: 22,
                    height: 22,
                    color: isSelected ? Color(0xFF6A4F37) : Colors.white70,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
