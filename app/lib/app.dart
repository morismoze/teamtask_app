import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/features/theme/data/theme_repository.dart';
import 'package:teamtask_app/router/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeRepositoryProvider).requireValue.themeMode;

    return MaterialApp.router(
      routerConfig: AppRouter(ref).config(),
      themeMode: themeMode,
      theme: appThemeData,
      darkTheme: appThemeDataDark,
      debugShowCheckedModeBanner: false,
    );
  }
}
