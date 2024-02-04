import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teamtask_app/features/onboarding/domain/onboarding.dart';
import 'package:teamtask_app/features/onboarding/presentation/onboarding_content.dart';

// OnBoarding content list
final List<Onboarding> data = [
  Onboarding(
    image: "assets/images/on-boarding/onboarding1.png",
    title: "Title 01",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  Onboarding(
    image: "assets/images/on-boarding/onboarding2.png",
    title: "Title 02",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  Onboarding(
    image: "assets/images/on-boarding/onboarding3.png",
    title: "Title 03",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  Onboarding(
    image: "assets/images/on-boarding/onboarding4.png",
    title: "Title 04",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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

  @override
  void initState() {
    super.initState();
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Carousel area
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardingContent(
                    title: data[index].title,
                    description: data[index].description,
                    image: data[index].image,
                    isLast: index == data.length - 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
