import 'package:flutter/material.dart';
import 'package:filkom_eats/screens/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Reset Your Password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const CustomTextField(label: "New Password", obscure: true),
            const CustomTextField(label: "Confirm Password", obscure: true),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
