import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/productGridBuilder.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/CustomSaleChip.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  String selectedChip = "All";
  String searchQuery = "";
  final TextEditingController searchController = TextEditingController();

  // 🛍️ Dummy Products (Same as Home)
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

  // 🧮 Filter by category chip
  List<Map<String, dynamic>> get filteredProducts {
    if (selectedChip == "All") return products;
    return products.where((p) => p['categories'].contains(selectedChip)).toList();
  }

  // 🧮 Apply both filters: chip + search
  List<Map<String, dynamic>> get visibleProducts {
    final categoryFiltered = filteredProducts;
    if (searchQuery.isEmpty) return categoryFiltered;
    return categoryFiltered
        .where((p) => p['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "All Products",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Simple Search Field
            CustomTextField(
              controller: searchController,
              hintText: "Search products...",
              fillColor: const Color(0xFFF4F4F4),
              borderColor: Colors.transparent,
              onChanged: (value) => setState(() => searchQuery = value),
            ),

            const SizedBox(height: 16),

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

            // 🛍️ Product Grid
            Expanded(
              child: visibleProducts.isEmpty
                  ? Center(
                      child: Text(
                        "No products found",
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ProductGridBuilder(filteredProducts: visibleProducts),
            ),
          ],
        ),
      ),
    );
  }
}
