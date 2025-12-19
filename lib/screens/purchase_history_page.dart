import 'package:flutter/material.dart';
import 'purchase_history_service.dart';
import 'rating_page.dart';

class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = PurchaseHistoryService.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text("Purchase History")),
      body: histories.isEmpty
          ? const Center(child: Text("Belum ada transaksi"))
          : ListView.builder(
              itemCount: histories.length,
              itemBuilder: (_, i) {
                final h = histories[i];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    children: h.items.map((item) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text("x${item.qty} • ${item.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.star),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RatingPage(item: item),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
    );
  }
}
