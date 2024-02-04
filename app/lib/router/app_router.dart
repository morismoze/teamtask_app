import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/features/home/presentation/home_screen.dart';
import 'package:teamtask_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:teamtask_app/router/router_guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter(this.ref) : super();

  WidgetRef ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          guards: [OnboardingGuard(ref)],
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
