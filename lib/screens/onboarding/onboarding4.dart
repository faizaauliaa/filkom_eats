import 'package:flutter/material.dart';
import 'onboarding_template.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingTemplate(
      title: "Welcome to Kantin FILKOM!",
      subtitle: "Order and enjoy your favorite meals!",
      isLast: true,
    );
  }
}
