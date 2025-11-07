import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/Screens/cartScreens/cartScreen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  int selectedImageIndex = 0;
  String selectedSize = "M";
  String selectedColor = "Brown";

  final String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF715137);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
        automaticallyImplyLeading: true,
      ),

      // ✅ Scrollable content
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80), // Space for bottom bar
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 Main image
            Image.asset(
              images[selectedImageIndex],
              key: ValueKey(selectedImageIndex),
              fit: BoxFit.cover,
              width: double.infinity,
            ),

            const SizedBox(height: 10),

            // 🔹 Thumbnail Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                height: 80,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.32),
                  itemCount: images.length,
                  padEnds: false,
                  onPageChanged: (index) {
                    setState(() => selectedImageIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedImageIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? brown : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () => setState(() => selectedImageIndex = index),
                          child: Image.asset(images[index], fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🧾 Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Female’s Style",
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Light Brown Jacket",
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text("4.5", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 🧾 Product Description
                  Text(
                    "Product Details",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _showFullDescriptionDialog(context),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Read more",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: brown,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🧍 Size Selection
                  Text(
                    "Select Size",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: ["S", "M", "L", "XL", "XXL"].map((size) {
                      final selected = selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: selected ? brown : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: selected ? brown : Colors.grey.shade400),
                          ),
                          child: Text(
                            size,
                            style: GoogleFonts.poppins(
                              color: selected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  // 🎨 Color Selection
                  Text(
                    "Select Color",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildColorCircle("Brown", brown),
                      _buildColorCircle("Black", Colors.black),
                      _buildColorCircle("Beige", const Color(0xFFDCC6A1)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🛒 Bottom bar outside scroll
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Price: PKR 3000",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomButton(
                    height: 40,
                    color: Colors.black,
                    textColor: Colors.white,
                    text: "Buy Now",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    size: 14,
                    hasIcon: false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomButton(
                    height: 40,
                    color: Colors.black,
                    textColor: Colors.white,
                    text: "Add to cart",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    size: 14,
                    hasIcon: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCircle(String colorName, Color color) {
    final isSelected = selectedColor == colorName;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = colorName),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? Colors.black : Colors.transparent, width: 2),
        ),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 16,
          child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
        ),
      ),
    );
  }

  void _showFullDescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Product Description",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade700, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
