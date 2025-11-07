import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/FlashSaleContainer.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/productGridBuilder.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/BannerSlider.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/CustomSaleChip.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/categoryItem.dart';
import 'package:maroq_ecommerce_apparels/Screens/ProductDetailsScreen/ProductDetailsScreen.dart';
import 'package:maroq_ecommerce_apparels/Screens/notificationScreen/Notificationscreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedChip = "All";
  String searchQuery = "";
  final TextEditingController searchController = TextEditingController();
  bool showSuggestions = false;

  // 🛍️ Dummy Products
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/men1.png',
      'title': 'Brown Jacket',
      'price': 83.97,
      'rating': 4.9,
      'categories': ['Newest', 'Man'],
    },
    {
      'image': 'assets/images/men2.jpg',
      'title': 'Casual Shirt',
      'price': 49.50,
      'rating': 4.6,
      'categories': ['Popular', 'Man'],
    },
    {
      'image': 'assets/images/women1.jpg',
      'title': 'Floral Dress',
      'price': 65.30,
      'rating': 4.8,
      'categories': ['Women', 'Newest'],
    },
    {
      'image': 'assets/images/women2.jpg',
      'title': 'Summer Top',
      'price': 40.75,
      'rating': 4.5,
      'categories': ['Women', 'Popular'],
    },
  ];

  // Filter by Sale Chip
  List<Map<String, dynamic>> get filteredProducts {
    if (selectedChip == "All") return products;
    return products.where((p) => p['categories'].contains(selectedChip)).toList();
  }

  // Filter by Search Query
  List<Map<String, dynamic>> get searchResults {
    if (searchQuery.isEmpty) return [];
    return products
        .where((p) => p['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 16,
        leadingWidth: 0,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                ),
                Text(
                  "Sialkot, Punjab",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF4F4F4),
                child: const Icon(Icons.notifications_none, color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      // 📱 Body
      body: SafeArea(
        child: Stack(
          children: [
            // Main Scrollable Content
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔍 Search Row
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: searchController,
                          hintText: "Search",
                          fillColor: const Color(0xFFF4F4F4),
                          borderColor: Colors.transparent,
                          // prefix: const Icon(Icons.search, color: Colors.black54),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                              showSuggestions = value.isNotEmpty;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      // 🧩 Dynamic Button: Filter or Close
                      GestureDetector(
                        onTap: () {
                          if (showSuggestions) {
                            // 🧹 Clear search
                            setState(() {
                              searchQuery = '';
                              showSuggestions = false;
                              searchController.clear();
                            });
                            FocusScope.of(context).unfocus(); // close keyboard
                          } else {
                            // 🧰 Open filters (later if needed)
                            print('Filter clicked');
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: showSuggestions ? Colors.grey.shade300 : Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            showSuggestions ? Icons.close : Icons.search,
                            color: showSuggestions ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  BannerSlider(
                    banners: [
                      {
                        'heading': 'New Collection',
                        'subHeading': 'Discount 50% for the first transaction',
                        'buttonText': 'Shop Now',
                        'bgImage': 'assets/images/banner1.png',
                      },
                      {
                        'heading': 'Winter Sale',
                        'subHeading': 'Get cozy with up to 40% off',
                        'buttonText': 'Explore',
                        'bgImage': 'assets/images/banner2.png',
                      },
                      {
                        'heading': 'Exclusive Deals',
                        'subHeading': 'Limited-time offers you can’t miss',
                        'buttonText': 'Check Now',
                        'bgImage': 'assets/images/banner2.png',
                      },
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🧥 Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryItem(name: "Shirts", icon: "assets/images/shirt.png"),
                      CategoryItem(name: "Pants", icon: "assets/images/jeans.png"),
                      CategoryItem(name: "Hoodies", icon: "assets/images/hoodie.png"),
                      CategoryItem(name: "Others", icon: "assets/images/other.png"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  FlashSaleContainer(),
                  const SizedBox(height: 20),

                  // 🔘 Sale Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...['All', 'Newest', 'Popular', 'Man', 'Women'].map(
                          (title) => GestureDetector(
                            onTap: () => setState(() => selectedChip = title),
                            child: SaleChip(title: title, selected: selectedChip == title),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  ProductGridBuilder(filteredProducts: filteredProducts),
                ],
              ),
            ),

            // 🧾 Search Suggestions Container
            if (showSuggestions && searchResults.isNotEmpty)
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: searchResults.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final product = searchResults[index];
                        return GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product['image'],
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              product['title'],
                              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              "\$${product['price']}",
                              style: GoogleFonts.poppins(color: Colors.grey.shade600),
                            ),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                showSuggestions = false;
                                searchController.clear();
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
