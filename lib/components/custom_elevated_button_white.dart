import 'package:flutter/material.dart';
import '../utils/theme/global_colors.dart';
import '../utils/theme/global_fonts.dart';

class CustomElevatedButtonWhiteIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButtonWhiteIcon({
    super.key,
    this.width,
    this.height,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor =
        backgroundColor ?? Theme.of(context).colorScheme.secondary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.0,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : icon,
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: GlobalFonts.fontFamilyJakarta,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
