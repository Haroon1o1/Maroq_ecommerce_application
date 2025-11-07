import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maroq_ecommerce_apparels/CommonWidgets/CustomDialogue.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> todayNotifications = [
    {
      'icon': Icons.local_shipping_outlined,
      'title': 'Order Shipped',
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
      'time': '1h',
      'isRead': false,
    },
    {
      'icon': Icons.local_offer_outlined,
      'title': 'Flash Sale Alert',
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
      'time': '1h',
      'isRead': true,
    },
  ];

  List<Map<String, dynamic>> yesterdayNotifications = [
    {
      'icon': Icons.star_border,
      'title': 'Product Review Request',
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
      'time': '1d',
      'isRead': true,
    },
    {
      'icon': Icons.account_balance_wallet_outlined,
      'title': 'New Paypal Added',
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
      'time': '1d',
      'isRead': true,
    },
  ];

  void markAllAsRead(List<Map<String, dynamic>> list) {
    setState(() {
      for (var item in list) {
        item['isRead'] = true;
      }
    });
  }

  Future<void> confirmClearAll() async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => CustomDialog(
        headline: "Clear All Notifications",
        subline: "Are you sure you want to delete all notifications?",
        redButton: "Cancel",
        greenButton: "Clear All",
        red: () {
          Navigator.pop(ctx, false); // close dialog and return false
        },
        green: () {
          Navigator.pop(ctx, true); // close dialog and return true
        },
      ),
    );

    if (confirm == true) {
      setState(() {
        todayNotifications.clear();
        yesterdayNotifications.clear();
      });
    }
  }

  Future<bool> confirmDelete(Map<String, dynamic> item) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => CustomDialog(
        headline: "Delete Notification",
        subline: "Are you sure you want to delete this notification?",
        redButton: "Cancel",
        greenButton: "Delete",
        red: () {
          Navigator.pop(ctx, false); // close dialog and return false
        },
        green: () {
          Navigator.pop(ctx, true); // close dialog and return true
        },
      ),
    );

    return confirm ?? false;
  }

  Widget buildSection(String title, List<Map<String, dynamic>> list) {
    if (list.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              GestureDetector(
                onTap: () => markAllAsRead(list),
                child: Text(
                  "Mark all as read",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B4F3B),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Notifications List
        ...list.map(
          (item) => Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete_outline, color: Colors.red),
            ),
            confirmDismiss: (_) => confirmDelete(item),
            onDismissed: (_) {
              setState(() {
                list.remove(item);
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: item['isRead'] ? Colors.grey.shade100 : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon Circle
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(color: Colors.brown.shade50, shape: BoxShape.circle),
                    child: Icon(item['icon'], color: Colors.brown, size: 22),
                  ),
                  const SizedBox(width: 12),

                  // Texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              style: GoogleFonts.poppins(
                                fontWeight: item['isRead'] ? FontWeight.w500 : FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              item['time'],
                              style: GoogleFonts.poppins(color: Colors.grey.shade500, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['message'],
                          style: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasNotifications = todayNotifications.isNotEmpty || yesterdayNotifications.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          if (hasNotifications)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: confirmClearAll,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Clear All",
                    style: GoogleFonts.poppins(
                      color: Colors.redAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: hasNotifications
          ? ListView(
              children: [
                buildSection("Today", todayNotifications),
                const SizedBox(height: 10),
                buildSection("Yesterday", yesterdayNotifications),
              ],
            )
          : Center(
              child: Text(
                "No notifications yet",
                style: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 15),
              ),
            ),
    );
  }
}
