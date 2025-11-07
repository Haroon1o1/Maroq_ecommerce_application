import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,

        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 👤 Profile Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/men1.jpg'),
                ),
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF715137)),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Esther Howard",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            // ⚙️ Menu Options
            Expanded(
              child: ListView(
                children: [
                  _buildProfileTile(Icons.person_outline, "Your profile"),
                  _buildProfileTile(Icons.credit_card_outlined, "Payment Methods"),
                  _buildProfileTile(Icons.shopping_bag_outlined, "My Orders"),
                  _buildProfileTile(Icons.settings_outlined, "Settings"),
                  _buildProfileTile(Icons.help_outline, "Help Center"),
                  _buildProfileTile(Icons.privacy_tip_outlined, "Privacy Policy"),
                  _buildProfileTile(Icons.group_outlined, "Invite Friends"),
                  // const SizedBox(height: 10),
                  _buildProfileTile(Icons.logout, "Log out", color: Colors.red),
                ],
              ),
            ),

            Text(
              "Powered by Maroq",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, {Color color = const Color(0xFF715137)}) {
    return Column(
      children: [
        ListTile(
          dense: true, // 👈 Makes the tile tighter
          visualDensity: const VisualDensity(vertical: 0), // 👈 Reduce height further
          leading: Icon(icon, color: color, size: 22),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black45),
          contentPadding: EdgeInsets.zero,
          onTap: () {},
        ),
        // 🔹 Light divider line
        const Divider(color: Color(0xFFE5E5E5), height: 1, thickness: 1),
      ],
    );
  }
}
