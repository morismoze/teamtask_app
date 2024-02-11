import 'package:flutter/material.dart';

//ignore: must_be_immutable
class AppFilledButton extends StatelessWidget {
  AppFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.disabled,
    this.isLoading,
  });

  final String text;
  final void Function() onPressed;
  IconData? icon;
  bool? disabled;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled == true || isLoading == true;

    return FilledButton(
      onPressed: isDisabled == true ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(isDisabled == true ? 0.5 : 1),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 56),
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
          if (icon != null)
            Icon(
              icon,
              color: Colors.white,
            ),
          const SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          if (isDisabled)
            Transform.scale(
              scale: 0.4,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
