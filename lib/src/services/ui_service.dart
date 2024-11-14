import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';

enum DialogStatus { warning, success }

enum ToastType { success, error, info }

@singleton
class UIService {
  void showToast({required String text, required ToastType type}) {
    toastification.show(
      type: type == ToastType.info
          ? ToastificationType.info
          : (type == ToastType.success)
              ? ToastificationType.success
              : ToastificationType.error,
      title: Text(text),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 6),
    );
  }
}