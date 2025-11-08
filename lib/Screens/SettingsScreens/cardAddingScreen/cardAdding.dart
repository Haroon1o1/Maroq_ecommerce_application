import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomButton.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomTextField.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  bool saveCard = false;

  String getCardType(String number) {
    if (number.startsWith('4')) return 'Visa';
    if (number.startsWith('5')) return 'MasterCard';
    return 'Card';
  }

  @override
  void initState() {
    super.initState();
    nameController.text = "Esther Howard";
    cardNumberController.text = "4716 9627 1635 8047";
    expiryController.text = "02/30";

    // Listen for changes and rebuild card UI
    cardNumberController.addListener(() => setState(() {}));
    nameController.addListener(() => setState(() {}));
    expiryController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    String cardType = getCardType(cardNumberController.text);
    String cardNumber = cardNumberController.text.isNotEmpty
        ? cardNumberController.text
        : "XXXX XXXX XXXX XXXX";
    String cardHolder = nameController.text.isNotEmpty ? nameController.text : "Your Name";
    String expiry = expiryController.text.isNotEmpty ? expiryController.text : "MM/YY";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: BackButton(),
        title: Text(
          "Add Card",
          style: GoogleFonts.poppins(fontSize: isTablet ? 22 : 18, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Color(0xFF715137),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16, vertical: 20),
        child: Column(
          children: [
            /// Credit Card Preview
            Container(
              width: double.infinity,
              height: isTablet ? 240 : 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF9C6B4A), Color(0xFF715137)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Top Row → Card Type and Number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cardNumber,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: isTablet ? 22 : 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        cardType.toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: isTablet ? 22 : 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  /// Bottom → Name / Expiry / Chip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// Cardholder details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card holder name",
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: isTablet ? 14 : 12,
                            ),
                          ),
                          Text(
                            cardHolder,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isTablet ? 16 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      /// Expiry and Chip
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Expiry date",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: isTablet ? 14 : 12,
                                ),
                              ),
                              Text(
                                expiry,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isTablet ? 16 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Image.asset('assets/images/chip.png', height: isTablet ? 40 : 30),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Card Holder Name
            CustomTextField(hintText: "Card Holder Name", controller: nameController),
            const SizedBox(height: 12),

            /// Card Number
            CustomTextField(
              hintText: "Card Number",
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(19),
                FilteringTextInputFormatter.digitsOnly,
                CardNumberInputFormatter(),
              ],
            ),
            const SizedBox(height: 12),

            /// Expiry and CVV Row
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Expiry Date (MM/YY)",
                    controller: expiryController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      ExpiryDateInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: "CVV",
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Save Card Checkbox
            Row(
              children: [
                Checkbox(
                  value: saveCard,
                  activeColor: const Color(0xFF715137),
                  onChanged: (val) => setState(() => saveCard = val ?? false),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                Text("Save Card", style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),

            const SizedBox(height: 16),

            /// Add Card Button
            CustomButton(
              text: "Add Card",
              height: isTablet ? 60 : 50,
              textColor: Colors.white,
              color: const Color(0xFF715137),
              hasIcon: false,
              size: isTablet ? 16 : 14,
              press: () {
                // handle card save logic
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// ✅ Formatter for "XXXX XXXX XXXX XXXX"
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) {
        buffer.write(' ');
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

/// ✅ Formatter for "MM/YY"
class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length >= 3) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    if (text.length > 5) text = text.substring(0, 5);

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
