import 'package:flutter/material.dart';
import '../seller_home_page.dart';

class SignUpSellerScreen extends StatelessWidget {
  const SignUpSellerScreen({super.key});

  void _registerSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SellerHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seller Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _field("Store Name"),
            _field("Owner Name"),
            _field("Email"),
            _field("Password", obscure: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _registerSuccess(context),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
