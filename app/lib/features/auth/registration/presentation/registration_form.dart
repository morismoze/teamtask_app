import 'package:flutter/material.dart';
import 'package:teamtask_app/shared/widgets/app_filled_button.dart';
import 'package:teamtask_app/shared/widgets/app_form_text_input.dart';
import 'package:teamtask_app/shared/widgets/app_subtitle_description.dart';
import 'package:teamtask_app/shared/widgets/app_text_button.dart';
import 'package:teamtask_app/shared/widgets/app_title.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
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

  void _handleOnSubmit() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
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
    return Form(
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
          ),
          const SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              text: 'Already have an account? Log in',
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          AppFilledButton(text: 'Sign Up', onPressed: _handleOnSubmit)
        ],
      ),
    );
  }
}
