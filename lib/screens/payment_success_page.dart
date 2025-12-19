import 'package:flutter/material.dart';
import 'order_status_page.dart';

class PaymentSuccessPage extends StatelessWidget {
  final int total;
  const PaymentSuccessPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffFF4D78),
              child: Icon(Icons.check, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment Successfull",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Rp$total"),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF4D78),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderStatusPage()),
                );
              },
              child: const Text("Get Order Status Here"),
            ),
          ],
        ),
      ),
    );
  }
}
