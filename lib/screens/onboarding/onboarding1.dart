import 'package:flutter/material.dart';
import 'onboarding_template.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingTemplate(
      title: "Discover Meals Based\nOn Your Taste",
      subtitle: "Personalized food recommendations\nto suit your cravings.",
      nextPage: Onboarding2(),
    );
  }
}
