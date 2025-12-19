import 'package:flutter/material.dart';
import 'order_status_page.dart';
import 'purchase_history.dart';
import 'purchase_history_service.dart';
import 'order_page.dart';

class PaymentPage extends StatelessWidget {
  final int total;
  final String location;
  final List<OrderItem> items;

  const PaymentPage({
    super.key,
    required this.total,
    required this.location,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: const Color(0xffFF4D78),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              height: 200,
              width: 200,
              color: Colors.grey.shade300,
              child: const Center(child: Text("QR CODE")),
            ),

            const SizedBox(height: 20),

            Text(
              "Rp$total",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF4D78),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              location,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF4D78),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                PurchaseHistoryService.add(
                  PurchaseHistory(
                    date: DateTime.now(),
                    total: total,
                    location: location,
                    items: items
                        .map(
                          (e) => PurchaseItem(
                            name: e.name,
                            price: e.price,
                            qty: e.qty,
                          ),
                        )
                        .toList(),
                  ),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => OrderStatusPage()),
                );
              },

              child: const Text("Saya Sudah Bayar"),
            ),
          ],
        ),
      ),
    );
  }
}
