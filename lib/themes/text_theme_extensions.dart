import 'package:flutter/material.dart';
import 'package:recipes/themes/app_fonts.dart';
import 'package:recipes/themes/color_palettes.dart';

extension FontFamily on TextStyle {
  TextStyle get poppins => copyWith(
        inherit: true,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );
}

class TextStyles {
  TextStyles._();
  static const TextStyle base = TextStyle(
    inherit: true,
    fontSize: 16,
    color: ColorPalettes.black,
  );
  static TextStyle poppins = base.poppins;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension AppFontSizes on TextStyle {
  TextStyle get s10 => copyWith(inherit: true, fontSize: 10);
  TextStyle get s12 => copyWith(inherit: true, fontSize: 12);
  TextStyle get s16 => copyWith(inherit: true, fontSize: 16);
  TextStyle get s20 => copyWith(inherit: true, fontSize: 20);
  TextStyle get s24 => copyWith(inherit: true, fontSize: 24);
  TextStyle get s28 => copyWith(inherit: true, fontSize: 28);
  TextStyle get s32 => copyWith(inherit: true, fontSize: 32);
  TextStyle get s36 => copyWith(inherit: true, fontSize: 36);
  TextStyle get s40 => copyWith(inherit: true, fontSize: 40);
  TextStyle get s48 => copyWith(inherit: true, fontSize: 48);
  TextStyle get s56 => copyWith(inherit: true, fontSize: 56);
}

extension AppFontWeight on TextStyle {
  TextStyle get w100 => copyWith(inherit: true, fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(inherit: true, fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(inherit: true, fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(inherit: true, fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(inherit: true, fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(inherit: true, fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(inherit: true, fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(inherit: true, fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(inherit: true, fontWeight: FontWeight.w900);
}

extension AppFontColor on TextStyle {
  TextStyle get blackColor => copyWith(inherit: true, color: Colors.black);
  TextStyle get secondary => copyWith(
      inherit: true, color: ColorPalettes.black.withValues(alpha: 0.4));
  TextStyle get error => copyWith(inherit: true, color: Colors.red);
  TextStyle get success => copyWith(inherit: true, color: Colors.green);
  TextStyle get warning => copyWith(inherit: true, color: Colors.orange);
  TextStyle get info => copyWith(inherit: true, color: Colors.blue);
  TextStyle get transparent => copyWith(
      inherit: true, color: ColorPalettes.black.withValues(alpha: 0.4));
  TextStyle get primary =>
      copyWith(inherit: true, color: ColorPalettes.primary);
  TextStyle get white => copyWith(inherit: true, color: Colors.white);
}

extension AppFontHeight on TextStyle {
  TextStyle get height100 => copyWith(inherit: true, height: 1.0);
  TextStyle get height150 => copyWith(inherit: true, height: 1.5);
  TextStyle get height200 => copyWith(inherit: true, height: 2.0);
  TextStyle get height250 => copyWith(inherit: true, height: 2.5);
  TextStyle get height300 => copyWith(inherit: true, height: 3.0);
}

extension AppFontDecoration on TextStyle {
  TextStyle get underline =>
      copyWith(inherit: true, decoration: TextDecoration.underline);
  TextStyle get lineThrough =>
      copyWith(inherit: true, decoration: TextDecoration.lineThrough);
  TextStyle get overline =>
      copyWith(inherit: true, decoration: TextDecoration.overline);
  TextStyle get none =>
      copyWith(inherit: true, decoration: TextDecoration.none);
  TextStyle get underlineBlack => copyWith(
        inherit: true,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black,
      );
}
