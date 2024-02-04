import 'package:flutter/material.dart';
import 'package:teamtask_app/shared/widgets/button.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.isLast,
  });

  final String image;
  final String title;
  final String description;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    void handleOnMainPressed() {
      if (isLast) {
      } else {}
    }

    return Column(
      children: [
        Button(
          text: isLast ? 'Sign me up' : 'Continue',
          onPressed: handleOnMainPressed,
        ),
      ],
    );
  }
}
