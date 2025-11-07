import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';

class ChatRoomScreen extends StatelessWidget {
  final String name;
  final String image;

  const ChatRoomScreen({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF715137);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: brown,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text('Online', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ],
        ),
        // actions:  [
        //   Icon(Icons.more_vert, color: Colors.white),
        //   SizedBox(width: 10),
        // ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "TODAY",
            style: GoogleFonts.poppins(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),

          // 🗨️ Messages
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildReceivedMessage("Hi there, Can i get some information about the product?"),
                _buildSentMessage(
                  "Here is the product details you requested. Let me know if you have any questions.",
                ),
                _buildReceivedImage("assets/images/men1.jpg"),
                _buildReceivedMessage(
                  "Umm i would like to know about the material used in this product.",
                ),
              ],
            ),
          ),

          // 📝 Message Input
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                Expanded(child: CustomTextField(hintText: "Type a message here...")),
                const SizedBox(width: 8),
                const Icon(Icons.attach_file, color: Colors.black54),
                const SizedBox(width: 8),
                const Icon(Icons.send, color: Colors.brown),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: GoogleFonts.poppins(fontSize: 13)),
      ),
    );
  }

  Widget _buildSentMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF715137),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: GoogleFonts.poppins(color: Colors.white, fontSize: 13)),
      ),
    );
  }

  Widget _buildReceivedImage(String imagePath) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 200, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text("08:04 pm", style: GoogleFonts.poppins(color: Colors.black45, fontSize: 11)),
        ],
      ),
    );
  }
}
