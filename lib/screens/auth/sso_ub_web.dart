import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../home_page.dart';

class SsoUbWebScreen extends StatelessWidget {
  const SsoUbWebScreen({super.key});

  void _loginSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SSO UB")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                html.window.open(
                  'https://auth.ub.ac.id/module.php/core/loginuserpass.php?AuthState=_d2df33be0c7f702862b4015b72d56d042e230f1289%3Ahttps%3A%2F%2Fauth.ub.ac.id%2Fsaml2%2Fidp%2FSSOService.php%3Fspentityid%3Duniv-brawijaya.zoom.us%26cookieTime%3D1765719854',
                  '_blank',
                );
              },
              child: const Text("Open UB SSO"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginSuccess(context),
              child: const Text("Simulate Login Success"),
            ),
          ],
        ),
      ),
    );
  }
}
