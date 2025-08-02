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
      elevation: 5,
      color: GlobalColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(3),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: [
              _buildRow('Service', item.serviceName),
              _buildRow('Quantity', item.quantity.toString()),
              _buildRow('Harga satuan', currency.format(item.price)),
              if (item.keterangan.isNotEmpty)
                _buildRow('Keterangan', item.keterangan),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            '$label:',
            style: const TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontSize: 14,
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
