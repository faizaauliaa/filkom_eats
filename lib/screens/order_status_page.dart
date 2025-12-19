import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _status("Order Accepted", true),
            _status("Order in process by the Store", true),
            _status("Order in Delivery", false),

            const SizedBox(height: 30),

            Center(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    color: Colors.grey.shade300,
                    child: const Center(child: Text("QR CODE")),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Show this QR Code when your order arrives",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _status(String text, bool done) {
    return Row(
      children: [
        Icon(
          done ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: done ? const Color(0xffFF4D78) : Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
