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
  final Color selectionColor;
  final Color borderColor;

  BaseTheme({
    required this.iconColor,
    required this.textColor,
    required this.cardColor,
    required this.selectionColor,
    required this.borderColor,
  })  : white = const Color(0xFFFFFFFF),
        black = const Color(0xFF000000),
        red = const Color(0xFFFF6838),
        green = const Color(0xFF25C26E);
}

class AppTheme {
  static BaseTheme get getTheme =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? BaseTheme(
            iconColor: const Color(0xFFA7B1BC),
            textColor: const Color(0xFFFFFFFF),
            cardColor: const Color(0xFF17181B),
            selectionColor: const Color(0xFF353945),
            borderColor: const Color(0xFF373B3F)
          )
        : BaseTheme(
            iconColor: const Color(0xFF737a91),
            textColor: const Color(0xFF1C2127),
            cardColor: const Color(0xFFFFFFFF),
            selectionColor: const Color(0xFFCFD3D8),
            borderColor: const Color(0xFF373B3F)
          );
  
}
