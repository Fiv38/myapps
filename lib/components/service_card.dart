import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/detail_carts.dart';
import '../utils/theme/global_colors.dart';
import '../utils/theme/global_fonts.dart';

class ServiceCard extends StatelessWidget {
  final DetailCart item;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Card(
      clipBehavior: Clip.antiAlias, // ripple & radius rapi
      elevation: 7,
      color: GlobalColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox.expand( // <-- isi penuh sel grid
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              children: [
                _buildRow(
                  'Service',
                  item.serviceName,
                  valueMaxLines: 2,         // nama panjang boleh 2 baris
                  valueSoftWrap: true,
                ),
                _buildRow('Qty', item.quantity.toString()),
                _buildRow('Harga', currency.format(item.price)),
                if (item.keterangan.isNotEmpty)
                  _buildRow('Keterangan', item.keterangan, valueMaxLines: 2, valueSoftWrap: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildRow(
      String label,
      String value, {
        int? valueMaxLines,
        bool valueSoftWrap = false,
      }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            '$label:',
            style: const TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            value,
            textAlign: TextAlign.right,
            maxLines: valueMaxLines,
            softWrap: valueSoftWrap,
            overflow: valueMaxLines != null
                ? TextOverflow.ellipsis
                : TextOverflow.visible,
            style: const TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: GlobalColors.mainTextBlack,
            ),
          ),
        ),
      ],
    );
  }
}
