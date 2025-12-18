import 'package:flutter/material.dart';
import 'signup_seller_screen.dart';
import 'sso_ub_web.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _menu(
              context,
              title: "Sign Up as Seller",
              icon: Icons.store,
              page: const SignUpSellerScreen(),
            ),
            const SizedBox(height: 16),
            _menu(
              context,
              title: "Sign Up with SSO UB",
              icon: Icons.school,
              page: const SsoUbWebScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(title),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
