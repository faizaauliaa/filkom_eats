import 'package:flutter/material.dart';
import '../main_navigation.dart';

class OnboardingTemplate extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? nextPage;
  final bool isLast;

  const OnboardingTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    this.nextPage,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon atau ilustrasi placeholder
            const Icon(Icons.fastfood, size: 80, color: Color(0xffFF4D78)),
            const SizedBox(height: 40),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF4D78),
              ),
            ),
            const SizedBox(height: 15),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 60),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF4D78),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isLast ? "Get Started" : "Next",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                if (isLast) {
                  // 👉 GO TO MAIN NAVIGATION
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavigation()),
                  );
                } else {
                  // 👉 GO TO NEXT ONBOARDING PAGE
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => nextPage!),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
