import 'package:flutter/material.dart';
import 'package:teamtask_app/shared/widgets/app_filled_button.dart';
import 'package:teamtask_app/shared/widgets/app_form_text_input.dart';
import 'package:teamtask_app/shared/widgets/app_subtitle_description.dart';
import 'package:teamtask_app/shared/widgets/app_text_button.dart';
import 'package:teamtask_app/shared/widgets/app_title.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const AppTitle(text: 'Welcome back!'),
          const SizedBox(
            height: 8,
          ),
          const AppSubtitleDescription(
            text: 'Your work is faster and more structured with TeamTask',
          ),
          const SizedBox(
            height: 40,
          ),
          AppFormTextInput(
            controller: _emailController,
            label: 'Email',
            prefixIcon: Icons.email,
            hint: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 12,
          ),
          AppFormTextInput(
            controller: _passwordController,
            label: 'Password',
            prefixIcon: Icons.password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              text: 'Don\'t have an account? Create one',
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
