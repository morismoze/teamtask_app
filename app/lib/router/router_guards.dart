import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/features/onboarding/data/onboarding_repository.dart';
import 'package:teamtask_app/router/app_router.dart';

class OnboardingGuard extends AutoRouteGuard {
  OnboardingGuard(this.ref) : super();

  WidgetRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final onboardingRepository =
        ref.read(onboardingRepositoryProvider).requireValue;

    if (onboardingRepository.isOnboardingComplete == true) {
      router.push(const HomeRoute());
    } else {
      resolver.next(true);
    }
  }
}
