import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/Screens/HomeScreen/productCard.dart';

class ProductGridBuilder extends StatelessWidget {
  List<Map<String, dynamic>> filteredProducts = [];
   ProductGridBuilder({super.key, required this.filteredProducts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // so it scrolls with the page
      itemCount: filteredProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅ 2 items per row
        crossAxisSpacing: 12, // space between columns
        mainAxisSpacing: 12, // space between rows
        childAspectRatio: 0.75, // adjust based on your ProductCard height
      ),
      itemBuilder: (context, index) {
        final p = filteredProducts[index];
        return ProductCard(
          image: p['image'],
          title: p['title'],
          price: p['price'],
          rating: p['rating'],
          isFavorite: false,
          onFavoriteTap: () {},
        );
      },
    );
  }
}
