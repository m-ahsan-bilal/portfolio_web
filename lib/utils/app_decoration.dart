// ignore_for_file: deprecated_member_use

import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // BoxDecoration shadowDecoration({double? radius}) {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(radius ?? 10),
  //     color: AppResources.colors.white,
  //     boxShadow: [
  //       BoxShadow(
  //         color: AppResources.colors.shadowColor.withOpacity(0.16),
  //         offset: const Offset(0, 9),
  //         blurRadius: 25,
  //       ),
  //     ],
  //   );
  // }

  // BoxDecoration borderDecoration({double? radius}) {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(15),
  //     color: AppResources.colors.white,
  //     boxShadow: [
  //       BoxShadow(
  //         color: AppResources.colors.textMediumGrey.withOpacity(.75),
  //         offset: const Offset(2, 2),
  //         spreadRadius: 2,
  //         blurRadius: 10,
  //       ),
  //       BoxShadow(
  //         color: AppResources.colors.textMediumGrey.withOpacity(.75),
  //         offset: const Offset(-2, -2),
  //         spreadRadius: 2,
  //         blurRadius: 10,
  //       )
  //     ],
  //   );
  // }

  // BoxDecoration dialogDecoration({double? radius}) {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(radius ?? 10),
  //     color: AppResources.colors.white,
  //   );
  // }
  InputDecoration fieldDecoration({
    required BuildContext context,
    Widget? preIcon,
    required String hintText,
    Widget? suffixIcon,
    double? radius,
    Color? fillColor,
    bool? isNotLocalized,
  }) {
    return InputDecoration(
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      hintText: (isNotLocalized ?? false) ? hintText : hintText,
      hintStyle: AppResources.textStyles.roboto(
        context: context,
        color: AppResources.colors.textMediumGrey.withOpacity(0.6),
        fontSize: 16, // Larger font size for better readability
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor:
          fillColor ?? const Color(0xffF1F4FE), // White or light background
      contentPadding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // Padding to control text alignment
      alignLabelWithHint: true, // Aligns the hint text at the top
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        borderSide: const BorderSide(
          // Thin border, will be invisible when not focused
          color:
              Colors.transparent, // Border color transparent when not focused
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        borderSide: const BorderSide(
          width: 2, // Thicker border when focused
          color: Color(0xffCCD7FD), // Border color on focus
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xffCCD7FD),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xffCCD7FD),
        ),
      ),
    );
  }
}
