import 'package:flutter/material.dart';
import 'package:teamtask_app/features/onboarding/domain/onboarding.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.data,
    required this.isLast,
  });

  final Onboarding data;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(data.image),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white, Colors.white10],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0, 0.1, 0.35]),
                ),
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, -20),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (data.description != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Text(
                        data.description!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
