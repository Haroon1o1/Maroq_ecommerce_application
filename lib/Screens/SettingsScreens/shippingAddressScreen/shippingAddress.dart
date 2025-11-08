import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomDialogue.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';

class ShippingAddressScreen extends StatefulWidget {
  ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> addresses = [
    {"title": "Home", "address": "1901 Thornridge Cir. Shiloh, Hawaii 81063"},
    {"title": "Office", "address": "4517 Washington Ave. Manchester, Kentucky 39495"},
    {"title": "Parent’s House", "address": "8502 Preston Rd. Inglewood, Maine 98380"},
    {"title": "Friend’s House", "address": "2464 Royal Ln. Mesa, New Jersey 45463"},
  ];

  void _showAddAddressSheet() {
    final TextEditingController addressController = TextEditingController();
    final TextEditingController areaController = TextEditingController();
    final TextEditingController postalController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Address",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            CustomTextField(hintText: "Address", controller: addressController),
            SizedBox(height: 12),
            CustomTextField(hintText: "Area", controller: areaController),
            SizedBox(height: 12),
            CustomTextField(
              hintText: "Postal code",
              keyboardType: TextInputType.number,
              controller: postalController,
            ),
            SizedBox(height: 20),
            CustomButton(
              size: 14,
              hasIcon: false,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFF715137),
              text: "Save Address",
              press: () {
                setState(() {
                  addresses.add({
                    "title": "New Address",
                    "address":
                        "${addressController.text}, ${areaController.text}, ${postalController.text}",
                  });
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _confirmDelete() {
    if (addresses.isEmpty) return;

    final title = addresses[_selectedIndex]["title"] ?? "this";

    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        headline: 'Delete Address',
        subline: 'Are you sure you want to delete the "$title" address?',
        red: () {
          setState(() {
            addresses.removeAt(_selectedIndex);
            if (_selectedIndex >= addresses.length && addresses.isNotEmpty) {
              _selectedIndex = addresses.length - 1;
            } else if (addresses.isEmpty) {
              _selectedIndex = 0;
            }
          });
          Navigator.pop(context);
        },
        green: () => Navigator.pop(context),
        redButton: 'Delete',
        greenButton: 'Cancel',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: BackButton(),
        title: Text(
          "Shipping Address",
          style: GoogleFonts.poppins(fontSize: isTablet ? 22 : 18, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Color(0xFF715137),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: addresses.isNotEmpty
            ? [
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.white),
                  tooltip: "Delete selected address",
                  onPressed: _confirmDelete,
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
        child: Column(
          children: [
            Expanded(
              child: addresses.isEmpty
                  ? Center(
                      child: Text(
                        "No address added yet",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 18 : 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: addresses.length,
                      separatorBuilder: (_, __) => Divider(height: 5),
                      itemBuilder: (context, index) {
                        final item = addresses[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => setState(() => _selectedIndex = index),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                            child: ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF715137),
                                size: 26,
                              ),
                              title: Text(
                                item["title"]!,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: isTablet ? 18 : 16,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                item["address"]!,
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 15 : 13,
                                  color: Colors.grey[700],
                                ),
                              ),
                              trailing: Transform.scale(
                                scale: isTablet ? 1.5 : 1.3,
                                child: Radio<int>(
                                  value: index,
                                  groupValue: _selectedIndex,
                                  activeColor: Color(0xFF715137),
                                  splashRadius: 22,
                                  onChanged: (val) => setState(() => _selectedIndex = val!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            /// Add New Address Button
            GestureDetector(
              onTap: _showAddAddressSheet,
              child: Container(
                width: double.infinity,
                height: isTablet ? 60 : 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Color(0xFF715137)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "+ Add New Shipping Address",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF715137),
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Apply Button
            CustomButton(
              text: "Apply",
              height: isTablet ? 60 : 50,
              textColor: Colors.white,
              press: () {},
              size: isTablet ? 16 : 14,
              hasIcon: false,
              color: Color(0xFF715137),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
