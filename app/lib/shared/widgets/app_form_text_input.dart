import 'package:flutter/material.dart';

class AppFormTextInput extends StatelessWidget {
  const AppFormTextInput({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText!,
          obscuringCharacter: '●',
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: Icon(suffixIcon),
            hintText: hint,
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.03),
            prefixIconColor: Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withOpacity(0.25),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withOpacity(0.2),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
