import 'package:ahsan_dev/utils/adaptive_textsize.dart';
import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/utils/go_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  TextStyle poppins({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return setFont(
        fontID: 0,
        context: navigatorKey.currentState!.context,
        color: color ?? AppResources.colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? 0,
        height: height,
        fontSize: fontSize ?? 12
        // fontSize:
        //     const AdaptiveTextSize().getAdaptiveTextSize(context, fontSize ?? 12),
        );
  }

  TextStyle montserrat({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return setFont(
      fontID: 1,
      context: navigatorKey.currentState!.context,
      color: color ?? AppResources.colors.white,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
      height: height ?? 1,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(
          navigatorKey.currentState!.context, fontSize ?? 12),
    );
  }

  TextStyle lemonMilkRegular({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'LemonMilk',
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(
          navigatorKey.currentState!.context, fontSize ?? 12),
      color: color,
      fontWeight: fontWeight,
    );
  }

  TextStyle damageplanPersonalUseBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'DamageplanPersonalUseBold',
      fontSize: 60,
      color: AppResources.colors.white,
      wordSpacing: 3,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle roboto({
    required BuildContext context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return setFont(
      fontID: 2,
      context: context,
      color: color ?? AppResources.colors.white,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
      height: height ?? 1,
      fontSize:
          const AdaptiveTextSize().getAdaptiveTextSize(context, fontSize ?? 12),
    );
  }

  setFont({
    required int fontID,
    required BuildContext context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    switch (fontID) {
      case 0:
        return GoogleFonts.poppins(
          color: color ?? AppResources.colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing ?? 0,
          height: height,
          // fontSize: fontSize ?? 12
          fontSize: const AdaptiveTextSize()
              .getAdaptiveTextSize(context, fontSize ?? 12),
        );
      case 1:
        return GoogleFonts.montserrat(
          color: color ?? AppResources.colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing ?? 0,
          height: height ?? 1,
          fontSize: const AdaptiveTextSize()
              .getAdaptiveTextSize(context, fontSize ?? 12),
        );
      default:
        return GoogleFonts.roboto(
          color: color ?? AppResources.colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing ?? 0,
          height: height ?? 1,
          fontSize: const AdaptiveTextSize()
              .getAdaptiveTextSize(context, fontSize ?? 12),
        );
    }
  }
}