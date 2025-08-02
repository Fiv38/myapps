import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastUtils {
  static void showSuccess(BuildContext context, {String? message}) {
    _showToast(
      context,
      message ?? "Successfully.",
      backgroundColor: Colors.green,
    );
  }

  static void showFailure(BuildContext context, {String? message}) {
    _showToast(
      context,
      message ?? "Unexpected Error.",
      backgroundColor: Colors.red,
    );
  }

  static void showInfo(BuildContext context, {String? message}) {
    _showToast(
      context,
      message ?? "Info message.",
      backgroundColor: Colors.blue,
    );
  }

  static void showWarning(BuildContext context, {String? message}) {
    _showToast(
      context,
      message ?? "Warning!",
      backgroundColor: Colors.orange,
    );
  }

  static void _showToast(
      BuildContext context,
      String message, {
        required Color backgroundColor,
      }) {
    showToast(
      message,
      context: context,
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      duration: const Duration(seconds: 3),
    );
  }
}

