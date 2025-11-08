import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/Screens/SettingsScreens/cardAddingScreen/cardAdding.dart';
import 'package:maroq_ecommerce_apparels/Screens/SettingsScreens/shippingAddressScreen/shippingAddress.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),

            // 👤 Profile Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(radius: 45, backgroundImage: AssetImage('assets/images/men1.jpg')),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF715137)),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Esther Howard",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),

            // ⚙️ Menu Options
            Expanded(
              child: ListView(
                children: [
                  _buildProfileTile(
                    Icons.person_outline,
                    "Your profile",
                    Color(0xFF715137),
                    onTap: () {
                      // logout logic
                    },
                  ),
                  _buildProfileTile(
                    Icons.credit_card_outlined,
                    "Payment Methods",
                    Color(0xFF715137),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCardScreen()),
                      );
                    },
                  ),
                  _buildProfileTile(
                    Icons.shopping_bag_outlined,
                    "My Orders",
                    Color(0xFF715137),
                    onTap: () {
                      // logout logic
                    },
                  ),
                  _buildProfileTile(
                    Icons.settings_outlined,
                    "Address Settings",
                    Color(0xFF715137),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShippingAddressScreen()),
                      );
                    },
                  ),
                  _buildProfileTile(
                    Icons.help_outline,
                    "Help Center",
                    Color(0xFF715137),
                    onTap: () {
                      // logout logic
                    },
                  ),
                  _buildProfileTile(
                    Icons.privacy_tip_outlined,
                    "Privacy Policy",
                    Color(0xFF715137),
                    onTap: () {
                      // logout logic
                    },
                  ),
                  _buildProfileTile(
                    Icons.group_outlined,
                    "Invite Friends",
                    Color(0xFF715137),
                    onTap: () {
                      // logout logic
                    },
                  ),
                  //  SizedBox(height: 10),
                  _buildProfileTile(
                    Icons.logout,
                    "Log out",
                    Colors.red,
                    onTap: () {
                      // logout logic
                    },
                  ),
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

  Widget _buildProfileTile(
    IconData icon,
    String title,
    Color color, {
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true, // 👈 Makes the tile tighter
          visualDensity: VisualDensity(vertical: 0), // 👈 Reduce height further
          leading: Icon(icon, color: color, size: 22),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.black45),
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
        ),
        // 🔹 Light divider line
        Divider(color: Color(0xFFE5E5E5), height: 1, thickness: 1),
      ],
    );
  }
}
