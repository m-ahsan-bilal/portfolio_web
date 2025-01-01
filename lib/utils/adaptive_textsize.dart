import 'package:ahsan_dev/utils/go_router.dart';
import 'package:ahsan_dev/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();
  getAdaptiveTextSize(BuildContext? context, dynamic value) {
    if (ResponsiveWidget.isLargeScreen(navigatorKey.currentState!.context)) {
      return value;
    } else if (ResponsiveWidget.isMediumScreen(
        navigatorKey.currentState!.context)) {
      return value;
    } else {
      return (value / 720) *
          MediaQuery.of(navigatorKey.currentState!.context).size.height;
    }
  }
}
