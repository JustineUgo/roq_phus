import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BaseTheme {
  final Color white;
  final Color black;
  final Color iconColor;
  final Color textColor;
  final Color green;
  final Color red;
  final Color cardColor;

  BaseTheme({
    required this.iconColor,
    required this.textColor,
    required this.cardColor,
  })  : white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        red = const Color(0xFFFF6838),
        green = const Color(0xFF25C26E);
}

class AppTheme {
  static BaseTheme getTheme() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? BaseTheme(
            iconColor: const Color(0xFFA7B1BC),
            textColor: const Color(0xFFFFFFFF),
            cardColor: const Color(0xFF17181B),
          )
        : BaseTheme(
            iconColor: const Color(0xFF737a91),
            textColor: const Color(0xFF1C2127),
            cardColor: const Color(0xFFFFFFFF),
          );
  }
}
