import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class AppTheme {
  AppTheme._();

  static final TextTheme textTheme =
      Typography.material2021(platform: TargetPlatform.android)
          .black
          .copyWith(
            displayLarge: TextStyles.poppins.s48.w400.height120,
            displayMedium: TextStyles.poppins.s40.w400.height120,
            displaySmall: TextStyles.poppins.s10.w400.height100,
            headlineLarge: TextStyles.poppins.s40.w400.height120,
            headlineMedium: TextStyles.poppins.s32.w400.height120,
            headlineSmall: TextStyles.poppins.s24.w400.height120,
            titleLarge: TextStyles.poppins.s28.w600.height150,
            titleMedium: TextStyles.poppins.s24.w700.height150,
            titleSmall: TextStyles.poppins.s16.w700.height150,
            bodyLarge: TextStyles.poppins.s20.height100,
            bodyMedium: TextStyles.poppins.s16.height100,
            bodySmall: TextStyles.poppins.s12.w400.height100,
            labelLarge: TextStyles.poppins.s14.w600.height120,
            labelMedium: TextStyles.poppins.s12.w500.height120,
            labelSmall: TextStyles.poppins.s10.w400.height120,
          )
          .apply(
            displayColor: ColorPalettes.black,
            bodyColor: ColorPalettes.black,
          );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorPalettes.primary,
    textTheme: textTheme,
    scaffoldBackgroundColor: ColorPalettes.backgroundShadow,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalettes.background,
      elevation: 0,
      titleTextStyle: textTheme.titleMedium,
      iconTheme: IconThemeData(color: ColorPalettes.primary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalettes.background,
      selectedItemColor: ColorPalettes.primary,
      unselectedItemColor: ColorPalettes.black.withValues(alpha: 0.4),
    ),
    cardTheme: CardTheme(
      color: ColorPalettes.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorPalettes.primary,
      foregroundColor: ColorPalettes.background,
      shape: const CircleBorder(),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        iconColor: WidgetStatePropertyAll(ColorPalettes.black),
        backgroundColor: WidgetStatePropertyAll(ColorPalettes.background),
        foregroundColor: WidgetStatePropertyAll(ColorPalettes.black),
        iconSize: WidgetStatePropertyAll(18),
        maximumSize: WidgetStatePropertyAll(const Size(48, 48)),
      ),
    ),
  );
}
