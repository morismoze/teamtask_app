import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    required this.text,
    this.alignment = TextAlign.center,
  });

  final String text;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Text(
        text,
        textAlign: alignment,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
