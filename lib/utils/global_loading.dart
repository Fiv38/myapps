import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> showLoadingDialog(
    BuildContext context, {
      bool isHideAfterSeconds = false,
      Duration hideDuration = const Duration(milliseconds: 1500),
      String lottieAsset = 'assets/anims/laundry-loading.json',
      String? message,
    }) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  lottieAsset,
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );

  if (isHideAfterSeconds) {
    await Future.delayed(hideDuration);
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
