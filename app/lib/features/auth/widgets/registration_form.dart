import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/features/auth/controllers/register_controller.dart';
import 'package:teamtask_app/models/request/register_request_dto.dart';
import 'package:teamtask_app/widgets/app_filled_button.dart';
import 'package:teamtask_app/widgets/app_form_text_input.dart';
import 'package:teamtask_app/widgets/app_subtitle_description.dart';
import 'package:teamtask_app/widgets/app_text_button.dart';
import 'package:teamtask_app/widgets/app_title.dart';
import 'package:teamtask_app/utils/validation.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({super.key, required this.navigateToLogin});

  final void Function() navigateToLogin;

  @override
  ConsumerState<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordRepeatController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
  }

  void _handleOnSubmit() async {
    if (_formKey.currentState!.validate()) {
      final registerController = ref.read(registerControllerProvider.notifier);
      final name = _fullNameController.text.split(' ');
      final firstName = name[0].trim();
      final lastName = name.sublist(1).join(' ').trim();

      await registerController.register(
        RegisterRequestDto(
          firstName: firstName,
          lastName: lastName,
          email: _emailController.text,
          password: _emailController.text,
        ),
      );

      // navigate to home
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerController = ref.watch(registerControllerProvider);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const AppTitle(text: 'Create account'),
            const SizedBox(
              height: 8,
            ),
            const AppSubtitleDescription(
              text: 'Create your account and feel the benefits',
            ),
            const SizedBox(
              height: 40,
            ),
            AppFormTextInput(
              controller: _fullNameController,
              label: 'Full Name',
              prefixIcon: Icons.person_4,
              hint: 'e.g. John Doe',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmptyValue()) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            AppFormTextInput(
              controller: _emailController,
              label: 'Email',
              prefixIcon: Icons.email,
              hint: 'e.g. name@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmptyValue()) {
                  return 'This field is required';
                } else if (!value.isValidEmail()) {
                  return 'Provided value is invalid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            AppFormTextInput(
              controller: _passwordController,
              label: 'Password',
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmptyValue()) {
                  return 'This field is required';
                } else if (!value.hasMinimumLength(6)) {
                  return 'Password must have at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            AppFormTextInput(
              controller: _passwordRepeatController,
              label: 'Confirm Password',
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmptyValue()) {
                  return 'This field is required';
                } else if (!value.matches(_passwordController.text)) {
                  return 'Passwords must match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 6,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AppTextButton(
                text: 'Already have an account? Log in',
                onPressed: widget.navigateToLogin,
              ),
            ),
            if (registerController.hasError)
              Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(registerController.error.toString())
                ],
              ),
            const SizedBox(
              height: 18,
            ),
            AppFilledButton(
              text: 'Sign Up',
              onPressed: _handleOnSubmit,
              disabled: registerController.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
