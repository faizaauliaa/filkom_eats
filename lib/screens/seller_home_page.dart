import 'package:flutter/material.dart';
import 'order_management_page.dart';
import 'transaction_recap_page.dart';
import 'seller_profile_page.dart';
import 'best_seller_page.dart';
import 'inventory_management_page.dart';
import 'store_settings_page.dart';

class SellerHomePage extends StatelessWidget {
  const SellerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF4D78),
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF4D78),
        elevation: 0,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= HEADER =================
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ================= CONTENT =================
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _SellerMenuCard(
                    title: 'Order Management',
                    icon: Icons.receipt_long,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OrderManagementPage(),
                        ),
                      );
                    },
                  ),
                  _SellerMenuCard(
                    title: 'Transaction Recap',
                    icon: Icons.bar_chart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TransactionRecapPage(),
                        ),
                      );
                    },
                  ),
                  _SellerMenuCard(
                    title: 'Best Seller',
                    icon: Icons.star,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BestSellerPage()),
                      );
                    },
                  ),
                  _SellerMenuCard(
                    title: 'Inventory Management',
                    icon: Icons.inventory_2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => InventoryManagementPage(),
                        ),
                      );
                    },
                  ),
                  _SellerMenuCard(
                    title: 'Store Settings',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => StoreSettingsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= DRAWER =================
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffFF4D78),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Icon(Icons.store, size: 40, color: Color(0xffFF4D78)),
          ),
          const SizedBox(height: 10),
          const Text(
            'Warung Henry',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Seller',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 30),

          _drawerItem(Icons.home, 'Home', context, () {}),
          _drawerItem(Icons.person_outline, 'Profile', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SellerProfilePage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(
    IconData icon,
    String title,
    BuildContext context,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}

// ================= MENU CARD =================
class _SellerMenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _SellerMenuCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffFF8FAB),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffFF4D78),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
