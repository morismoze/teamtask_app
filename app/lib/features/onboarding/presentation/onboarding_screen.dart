import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamtask_app/features/auth/pages/auth_page.dart';
import 'package:teamtask_app/features/onboarding/domain/onboarding.dart';
import 'package:teamtask_app/features/onboarding/presentation/onboarding_content.dart';
import 'package:teamtask_app/features/onboarding/presentation/onboarding_dot_indicator.dart';
import 'package:teamtask_app/router/app_router.dart';
import 'package:teamtask_app/widgets/app_filled_button.dart';
import 'package:teamtask_app/widgets/app_text_button.dart';

const List<Onboarding> data = [
  Onboarding(
    image: "assets/images/onboarding/onboarding-one.png",
    title: "Your convenience in making a todo list",
    description:
        "Here's a mobile platform that helps you create task or to list so that it can help you in every job easier and faster.",
  ),
  Onboarding(
    image: "assets/images/onboarding/onboarding-two.png",
    title: "Find the practicality in making your todo list",
    description:
        "Easy-to-understand user interface  that makes you more comfortable when you want to create a task or to do list, TeamTask can also improve productivity",
  ),
  Onboarding(
    image: "assets/images/onboarding/onboarding-three.png",
    title: "Welcome to TeamTask",
  ),
];

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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

  void _handleOnNavigate() {
    if (_pageIndex < data.length - 1) {
      _pageController.animateToPage(
        _pageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    } else {
      context.router.push(AuthRoute(initial: AuthPages.registration));
    }
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
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 24, bottom: 32, left: 24),
          child: Column(
            children: [
              if (_pageIndex < data.length - 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    text: 'Skip',
                    onPressed: () {
                      _pageController.jumpToPage(data.length - 1);
                    },
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 7,
                      child: PageView.builder(
                        itemCount: data.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _pageIndex = index;
                          });
                        },
                        itemBuilder: (context, pageIndex) => OnboardingContent(
                          data: Onboarding(
                            title: data[pageIndex].title,
                            description: data[pageIndex].description,
                            image: data[pageIndex].image,
                          ),
                          isLast: pageIndex == data.length - 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        spacing: 6,
                        children: [
                          ...List.generate(
                            data.length,
                            (index) => OnboardingDotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppFilledButton(
                text: _pageIndex == data.length - 1 ? 'Sign me up' : 'Continue',
                onPressed: _handleOnNavigate,
                icon: _pageIndex == data.length - 1 ? Icons.email : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
