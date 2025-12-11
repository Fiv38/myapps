import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/theme/global_fonts.dart';

class TotalRow extends StatelessWidget {
  final String label;
  final num value;

  const TotalRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: GlobalFonts.fontFamilyJakarta,
            ),
          ),
          Text(
            formatter.format(value),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: GlobalFonts.fontFamilyJakarta,
            ),
          ),
        ],
      ),
    );
  }
}
