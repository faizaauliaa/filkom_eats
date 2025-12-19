import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final Color primaryPink = const Color(0xFFFF5C8A);

  final List<String> options = ['On', 'Off', 'Silent'];

  String newOrder = 'On';
  String orderStatus = 'On';
  String lowStock = 'On';
  String payout = 'On';
  String appUpdates = 'On';
  String reviews = 'On';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryPink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Notification Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _dropdownTile(
            title: "New Order Alert",
            icon: Icons.shopping_bag,
            value: newOrder,
            onChanged: (v) => setState(() => newOrder = v!),
          ),
          _dropdownTile(
            title: "Order Status Update",
            icon: Icons.sync,
            value: orderStatus,
            onChanged: (v) => setState(() => orderStatus = v!),
          ),
          _dropdownTile(
            title: "Low Stock Alert",
            icon: Icons.inventory_2,
            value: lowStock,
            onChanged: (v) => setState(() => lowStock = v!),
          ),
          _dropdownTile(
            title: "Payout Notification",
            icon: Icons.account_balance_wallet,
            value: payout,
            onChanged: (v) => setState(() => payout = v!),
          ),
          _dropdownTile(
            title: "App Updates & Features",
            icon: Icons.system_update,
            value: appUpdates,
            onChanged: (v) => setState(() => appUpdates = v!),
          ),
          _dropdownTile(
            title: "New Reviews & Ratings",
            icon: Icons.rate_review,
            value: reviews,
            onChanged: (v) => setState(() => reviews = v!),
          ),

          const SizedBox(height: 30),

          // ================= SAVE BUTTON =================
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _saveSettings,
              child: const Text(
                "Save Changes",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= LOGIC =================
  void _saveSettings() {
    // TODO: simpan ke backend / local storage
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Notification settings saved")),
    );
    Navigator.pop(context);
  }

  // ================= UI =================
  Widget _dropdownTile({
    required String title,
    required IconData icon,
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFFFE4EC),
            child: Icon(icon, color: primaryPink),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            items: options
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
