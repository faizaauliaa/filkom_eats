import 'package:flutter/material.dart';
import 'onboarding_template.dart';
import 'onboarding4.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingTemplate(
      title: "Locate Kantin &\nPick-Up Points",
      subtitle: "Find the nearest food pick-up location easily.",
      nextPage: Onboarding4(),
    );
  }
}
