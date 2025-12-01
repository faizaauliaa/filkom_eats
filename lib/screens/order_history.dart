import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';
import '../models/order.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final history = orderProvider.orders;

    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Pesanan")),
      body: history.isEmpty
          ? const Center(child: Text("Belum ada pesanan"))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final Order order = history[index];
                final total = order.total;

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Pesanan ke-${index + 1}"),
                    subtitle: Text("Total: Rp $total"),
                  ),
                );
              },
            ),
    );
  }
}
