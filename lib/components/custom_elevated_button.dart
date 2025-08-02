import 'package:flutter/material.dart';
import '../utils/theme/global_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool outlined;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Color? textColor;
  final double elevation;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
    this.width,
    this.height = 48,
    this.gradient,
    this.borderRadius,
    this.padding,
    this.borderColor,
    this.textColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border.all(
      color: borderColor ?? Colors.blue,
      width: outlined ? 2 : 0,
    );

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: outlined ? null : gradient,
        color: outlined ? Colors.transparent : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: border,
        boxShadow: elevation > 0
            ? [BoxShadow(color: Colors.black26, blurRadius: elevation)]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontFamily: GlobalFonts.fontFamilyJakarta,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
