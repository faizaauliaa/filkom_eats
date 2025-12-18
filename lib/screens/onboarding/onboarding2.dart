import 'package:flutter/material.dart';
import 'onboarding_template.dart';
import 'onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingTemplate(
      title: "Real-Time Delivery\nAvailability",
      subtitle: "Track delivery availability from each canteen.",
      nextPage: Onboarding3(),
    );
  }
}

