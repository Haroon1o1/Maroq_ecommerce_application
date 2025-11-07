import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/Screens/chatScreens/chatRoom.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF715137);

    final List<Map<String, String>> chats = [
      {
        'name': 'Angie Brekke',
        'message': 'Hey! How are you?',
        'time': '08:04 pm',
        'image': 'assets/images/men1.jpg',
      },
      {
        'name': 'Esther Howard',
        'message': 'Can you send me that photo?',
        'time': '07:51 pm',
        'image': 'assets/images/men2.jpg',
      },
      {
        'name': 'Ralph Edwards',
        'message': 'Sure! Will do it soon',
        'time': '07:32 pm',
        'image': 'assets/images/women1.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemCount: chats.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFE5E5E5)),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(radius: 26, backgroundImage: AssetImage(chat['image']!)),
            title: Text(
              chat['name']!,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              chat['message']!,
              style: GoogleFonts.poppins(color: Colors.black54, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              chat['time']!,
              style: GoogleFonts.poppins(color: Colors.black45, fontSize: 11),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatRoomScreen(name: chat['name']!, image: chat['image']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
