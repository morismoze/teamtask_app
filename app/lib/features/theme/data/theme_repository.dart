import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_repository.g.dart';

class ThemeRepository {
  ThemeRepository(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  static const themeKey = 'theme';

  ThemeMode get themeMode {
    final themeValue = sharedPreferences.getInt(themeKey);
    if (themeValue == null) return ThemeMode.light;

    return ThemeMode.values[themeValue];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await sharedPreferences.setInt(themeKey, theme.index);
  }
}

@Riverpod(keepAlive: true)
Future<ThemeRepository> themeRepository(ThemeRepositoryRef ref) async {
  return ThemeRepository(await SharedPreferences.getInstance());
}

final appThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF256BFD),
  ),
  textTheme: GoogleFonts.barlowTextTheme(),
);

final appThemeDataDark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF256BFD),
  ),
  textTheme: GoogleFonts.barlowTextTheme(),
);
