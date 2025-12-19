import 'package:flutter/material.dart';
import 'favorite_manager.dart';
import 'order_page.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = FavouriteManager.favourites;

    return Scaffold(
      backgroundColor: const Color(0xffFF4D78),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF4D78),
        title: const Text("Favourite"),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                "Belum ada favourite ❤️",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: items.map((e) => _card(context, e)).toList(),
            ),
    );
  }

  Widget _card(BuildContext context, FavouriteItem item) {
    return InkWell(
      onTap: () {
        // 👉 DIRECT KE ORDER PAGE
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderPage(
              orderItems: [
                OrderItem(
                  name: item.name,
                  note: item.note,
                  price: item.price,
                  qty: 1,
                ),
              ],
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.favorite, color: Color(0xffFF4D78)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (item.note.isNotEmpty)
                    Text(
                      item.note,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  Text(
                    item.price,
                    style: const TextStyle(color: Color(0xffFF4D78)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }
}
