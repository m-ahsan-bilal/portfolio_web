import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomBotToast {
  static void show({
    required String message,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 2),
    Duration animationDuration = const Duration(milliseconds: 700),
    Duration animationReverseDuration = const Duration(milliseconds: 400),
    Alignment align = Alignment.bottomCenter,
  }) {
    BotToast.showText(
      text: message,
      duration: duration,
      animationDuration: animationDuration,
      animationReverseDuration: animationReverseDuration,
      align: align,
      contentColor: backgroundColor,
      textStyle: TextStyle(color: textColor, fontSize: 16),
    );
  }
}
