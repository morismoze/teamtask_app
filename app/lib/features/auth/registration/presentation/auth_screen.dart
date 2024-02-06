import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamtask_app/features/auth/registration/presentation/login_form.dart';
import 'package:teamtask_app/features/auth/registration/presentation/registration_form.dart';

// We have two pages: register (0) and login (1)
const kNumberOfPages = 2;

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.initial = 0});

  final int initial;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 32),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(
                () {
                  _pageIndex = index;
                },
              );
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RegistrationForm(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
