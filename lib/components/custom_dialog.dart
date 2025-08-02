import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'package:myapps/utils/theme/global_colors.dart';
import 'package:myapps/utils/theme/global_fonts.dart';

import 'custom_elevated_button.dart';

/// Dialog Type:
/// 1 => Warning
/// 2 => Error
/// Other => Success
class CustomInformationDialog extends StatelessWidget {
  final int dialogType;
  final String confirmMessage;
  final String message;
  final bool isPositiveDialog;
  final String? customText;
  final bool showTwoButtons;
  final VoidCallback? onConfirmed;

  const CustomInformationDialog({
    required this.dialogType,
    required this.confirmMessage,
    required this.message,
    this.isPositiveDialog = false,
    this.customText,
    this.showTwoButtons = false,
    this.onConfirmed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String animationPath;
    if (dialogType == 1) {
      animationPath = "assets/anims/warning_anim.json";
    } else if (dialogType == 2) {
      animationPath = "assets/anims/error_anim.json";
    } else {
      animationPath = "assets/anims/correct_anim.json";
    }

    return Dialog(
      backgroundColor: GlobalColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.8,
          maxHeight: size.height * 0.8,
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                LottieBuilder.asset(animationPath, height: 150),
                const SizedBox(height: 16),
                Text(
                  confirmMessage,
                  style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.mainTextBlack,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                if (showTwoButtons) ...[
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          label: "Close",
                          textColor: Colors.black,
                          elevation: 5,
                          onPressed: () => Navigator.pop(context, false),
                          gradient: const LinearGradient(
                            colors: [Colors.white, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomElevatedButton(
                          label: customText ?? "Logout",
                          onPressed: () {
                            Navigator.pop(context, true);
                            if (onConfirmed != null) onConfirmed!();
                          },
                          elevation: 5,
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.redAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  )
                ] else
                  CustomElevatedButton(
                    label: customText ?? "Close",
                    icon: SvgPicture.asset(
                      isPositiveDialog
                          ? "assets/icons/restore.svg"
                          : "assets/icons/close.svg",
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    elevation: 5,
                    gradient: isPositiveDialog
                        ? const LinearGradient(
                      colors: [Colors.green, Colors.lightGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : const LinearGradient(
                      colors: [Colors.red, Colors.redAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

