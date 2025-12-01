import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final int total = cart.totalPrice;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color(0xffFF4D78),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Payment: Rp $total",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            const Text("Delivery to Class / Lab:"),
            TextField(
              controller: classController,
              decoration: const InputDecoration(
                hintText: "ex: IF-3.13 / Lab JTI",
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF4D78),
                ),
                onPressed: () {
                  if (classController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter class/lab")),
                    );
                    return;
                  }

                  final destination = classController.text;
                  cart.clearCart(); // Provider clear cart

                  Navigator.pop(context); // Kembali ke Cart
                  Navigator.pop(context); // Kembali ke Main Navigation

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Order being delivered to $destination"),
                    ),
                  );
                },
                child: const Text("Confirm Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
