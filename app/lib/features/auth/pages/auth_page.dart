import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamtask_app/features/auth/widgets/login_form.dart';
import 'package:teamtask_app/features/auth/widgets/registration_form.dart';

enum AuthPages { registration, login }

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key, this.initial = AuthPages.registration});

  final AuthPages initial;

  @override
  State<AuthPage> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    _pageController = PageController(initialPage: widget.initial.index);
  }

  void navigateTo(AuthPages page) {
    _pageController.animateToPage(
      page.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 32),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RegistrationForm(navigateToLogin: () {
                navigateTo(AuthPages.login);
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LoginForm(navigateToRegistration: () {
                navigateTo(AuthPages.registration);
              }),
            )
          ],
        ),
      ),
    ));
  }
}
