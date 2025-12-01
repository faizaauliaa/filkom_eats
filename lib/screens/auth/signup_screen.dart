import 'package:flutter/material.dart';
import 'package:filkom_eats/screens/widgets/custom_textfield.dart';
import 'verification_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Sign Up Your Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const CustomTextField(label: "First Name"),
            const CustomTextField(label: "Last Name"),
            const CustomTextField(label: "Email"),
            const CustomTextField(label: "Password", obscure: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VerificationScreen()),
              ),
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 16),
            Image.asset("assets/google_fb.png", height: 40),
          ],
        ),
      ),
    );
  }
}
