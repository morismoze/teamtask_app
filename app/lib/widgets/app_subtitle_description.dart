import 'package:flutter/material.dart';

class AppSubtitleDescription extends StatelessWidget {
  const AppSubtitleDescription({
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
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    );
  }
}
