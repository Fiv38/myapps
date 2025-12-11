import 'package:flutter/material.dart';
import '../../utils/theme/global_fonts.dart';

class CustomCardSeparate extends StatelessWidget {
  final String title;

  /// BACK-COMPAT:
  /// Jika [address] & [phone] null, widget akan memakai [detail] lama.
  final String detail;

  /// Baru: alamat & phone dipisah. Jika diisi, [detail] diabaikan.
  final String? address;
  final String? phone;

  /// Tinggi tetap agar semua kartu seragam
  final double height;

  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? addressStyle;
  final TextStyle? phoneStyle;
  final TextStyle? detailStyle; // dipakai hanya saat address/phone null
  final IconData? rightIcon;

  /// Interaksi opsional (kalau kamu pakai versi sebelumnya)
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String editLabel;
  final String deleteLabel;
  final Color? deleteColor;

  const CustomCardSeparate({
    super.key,
    required this.title,
    this.detail = "",
    this.address,
    this.phone,

    this.height = 100, // <-- tinggi tetap default
    this.padding = const EdgeInsets.only(left: 12, right: 16, top: 14, bottom: 14),
    this.backgroundColor = Colors.white,
    this.titleStyle,
    this.addressStyle,
    this.phoneStyle,
    this.detailStyle,
    this.rightIcon,

    this.onTap,
    this.onEdit,
    this.onDelete,
    this.editLabel = "Edit",
    this.deleteLabel = "Delete",
    this.deleteColor,
  });

  bool get _hasActions => onEdit != null || onDelete != null;

  @override
  Widget build(BuildContext context) {
    final bool useAddressPhone =
        (address != null && address!.trim().isNotEmpty) ||
            (phone != null && phone!.trim().isNotEmpty);

    final card = Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: SizedBox( // <-- fix height
        height: height,
        child: Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // center vertical
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title: 1 line
                    Text(
                      title,
                      style: titleStyle ??
                          const TextStyle(
                            fontFamily: GlobalFonts.fontFamilyJakarta,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.1,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Address (max 2) + Phone (max 1) => total <= 3 lines
                    if (useAddressPhone) ...[
                      const SizedBox(height: 6),
                      if ((address ?? '').trim().isNotEmpty)
                        Text(
                          address!.trim(),
                          maxLines: 3, // <= 2 lines
                          overflow: TextOverflow.ellipsis,
                          style: addressStyle ??
                              TextStyle(
                                fontFamily: GlobalFonts.fontFamilyJakarta,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 1.25,
                                color: Colors.grey[800],
                              ),
                          softWrap: true,
                        ),
                      if ((phone ?? '').trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          phone!.trim(),
                          maxLines: 1, // <= 1 line
                          overflow: TextOverflow.ellipsis,
                          style: phoneStyle ??
                              TextStyle(
                                fontFamily: GlobalFonts.fontFamilyJakarta,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 1.25,
                                color: Colors.grey[700],
                              ),
                        ),
                      ],
                    ]

                    // Fallback: detail tunggal (max 3 lines)
                    else if (detail.trim().isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        detail.trim(),
                        maxLines: 3, // <= 3 lines
                        overflow: TextOverflow.ellipsis,
                        style: detailStyle ??
                            TextStyle(
                              fontFamily: GlobalFonts.fontFamilyJakarta,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 1.25,
                              color: Colors.grey[700],
                            ),
                        softWrap: true,
                      ),
                    ],
                  ],
                ),
              ),

              // Right icon opsional
              if (rightIcon != null) ...[
                const SizedBox(width: 10),
                Icon(rightIcon, size: 18, color: Colors.grey[600]),
              ],
            ],
          ),
        ),
      ),
    );

    // InkWell untuk tap (opsional)
    if (_hasActions || onTap != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (_hasActions) {
            _showActionSheet(context);
          } else {
            onTap?.call();
          }
        },
        child: card,
      );
    }
    return card;
  }

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: (address != null && address!.trim().isNotEmpty)
                    ? Text(address!, maxLines: 2, overflow: TextOverflow.ellipsis)
                    : (detail.trim().isNotEmpty ? Text(detail, maxLines: 2, overflow: TextOverflow.ellipsis) : null),
              ),
              if (onEdit != null) ...[
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(editLabel),
                  onTap: () {
                    Navigator.pop(ctx);
                    onEdit!.call();
                  },
                ),
              ],
              if (onDelete != null) ...[
                const Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.delete, color: deleteColor ?? Colors.red),
                  title: Text(deleteLabel, style: TextStyle(color: deleteColor ?? Colors.red)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onDelete!.call();
                  },
                ),
              ],
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
