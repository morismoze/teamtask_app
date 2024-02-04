import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final String text;
  final void Function() onPressed;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary),
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 60),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
