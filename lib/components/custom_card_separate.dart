import 'package:flutter/material.dart';
import '../../utils/theme/global_fonts.dart';

class CustomCardSeparate extends StatelessWidget {
  final String title;
  final String detail;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? detailStyle;
  final IconData? rightIcon;

  const CustomCardSeparate({
    super.key,
    required this.title,
    required this.detail,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.backgroundColor = Colors.white,
    this.titleStyle,
    this.detailStyle,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: titleStyle ??
                    const TextStyle(
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  detail,
                  style: detailStyle ??
                      TextStyle(
                        fontFamily: GlobalFonts.fontFamilyJakarta,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                ),
                if (rightIcon != null) ...[
                  const SizedBox(width: 6),
                  Icon(rightIcon, size: 16, color: Colors.grey[600]),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
