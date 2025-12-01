import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xffFF4D78),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xffFFE3EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.delivery_dining,
                color: Color(0xffFF4D78),
              ),
            ),
            title: const Text("Your Order is in Delivery Process !"),
            subtitle: const Text("Mie Yamin & Es Teh"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
