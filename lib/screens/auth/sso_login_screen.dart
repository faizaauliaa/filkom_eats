import 'package:flutter/material.dart';
import 'package:filkom_eats/screens/main_navigation.dart';

class SsoLoginScreen extends StatelessWidget {
  const SsoLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sistem Autentikasi Universitas Brawijaya",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const TextField(decoration: InputDecoration(labelText: "Username")),
            const SizedBox(height: 14),
            const TextField(decoration: InputDecoration(labelText: "Password")),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainNavigation()),
                );
              },
              child: const Text("Sign In"),
            ),

            const SizedBox(height: 45),
            Text("Continue", style: TextStyle(color: Colors.grey[600])),

          ],
        ),
      ),
    );
  }
}
