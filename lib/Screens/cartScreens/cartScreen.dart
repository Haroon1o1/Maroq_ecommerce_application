import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const CartScreen());
  }
}

class CartItem {
  final String name;
  final String size;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(name: 'Brown Jacket', size: 'XL', price: 83.97, image: 'assets/images/men1.png'),
    CartItem(name: 'Brown Suite', size: 'XL', price: 120, image: 'assets/images/men2.jpg'),
    CartItem(name: 'Brown Jacket', size: 'XL', price: 83.97, image: 'assets/images/women2.jpg'),
  ];

  double get subTotal => _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    const deliveryFee = 25.0;
    const discount = 35.0;
    final totalCost = subTotal + deliveryFee - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: const BackButton(color: Colors.black),
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Dismissible(
                  key: ValueKey(item.name + index.toString()),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Remove Item"),
                        content: Text(
                          "Are you sure you want to remove '${item.name}' from the cart?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: const Text("Remove"),
                          ),
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    setState(() => _cartItems.removeAt(index));
                  },
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item.image, width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text("Size: ${item.size}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (item.quantity > 1) {
                              setState(() => item.quantity--);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () => setState(() => item.quantity++),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Promo Code",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CustomButton(
                        height: 45,
                        textColor: Colors.white,
                        text: "Apply",
                        press: () {},
                        size: 14,
                        hasIcon: false,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildPriceRow("Sub-Total", "PKR ${subTotal.toStringAsFixed(2)}"),
                _buildPriceRow("Delivery Fee", "PKR ${deliveryFee.toStringAsFixed(2)}"),
                _buildPriceRow("Discount", "-PKR ${discount.toStringAsFixed(2)}"),
                const Divider(thickness: 1),
                _buildPriceRow("Total Cost", "PKR ${totalCost.toStringAsFixed(2)}", isBold: true),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CustomButton(
                      height: 45,
                      textColor: Colors.white,
                      text: "Proceed to Checkout",
                      press: () {},
                      size: 14,
                      hasIcon: false,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
