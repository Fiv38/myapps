import 'package:flutter/material.dart';
import '../utils/theme/global_colors.dart';
import 'four_rotating_dots_custom.dart';

Future<void> loadingDialog(
    BuildContext context, {
      bool isHideAfterSeconds = false,
      Duration hideDuration = const Duration(milliseconds: 1500),
    }) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: FourRotatingDots(
            size: 60,
            color: GlobalColors.white, // fallback jika colors null
            colors: const [
              GlobalColors.primaryBlue,     // kiri
              GlobalColors.secondaryBlue,   // kanan
              GlobalColors.accentSky,    // atas
              GlobalColors.softGray,  // bawah
            ],
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
