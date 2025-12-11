import 'package:flutter/material.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../models/payment_status.dart';

class PaymentMethodStatusDropdown extends StatelessWidget {
  final String? selectedId;
  final List<PaymentStatus> statuses;
  final ValueChanged<String?> onChanged;

  const PaymentMethodStatusDropdown({
    super.key,
    required this.selectedId,
    required this.statuses,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double kInset = 8.0; // konsisten padding kiri/kanan

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Pembayaran Status',
              style: TextStyle(
                fontFamily: GlobalFonts.fontFamilyJakarta,
                fontWeight: FontWeight.w700,
                color: GlobalColors.mainTextBlack,
              ),
            ),
            SizedBox(width: 4),
            Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: size.height * 0.01),

        DropdownButtonFormField<String>(
          value: selectedId,
          isExpanded: true,               // biar child isi penuh & bisa ellipsis
          dropdownColor: Colors.white,    // popup background putih
          menuMaxHeight: 360,
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.white,
            hintText: 'Pilih status pembayaran',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: kInset, vertical: 4, // sejajar label
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: GlobalColors.mainTextBlack, width: 1.5),
            ),
          ),

          // Tampilan item TERPILIH di field (ellipsis & left align)
          selectedItemBuilder: (context) {
            return statuses.map((s) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  s.paymentStatusName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    color: GlobalColors.mainTextBlack,
                  ),
                ),
              );
            }).toList();
          },

          // Item di popup + divider tiap baris, padding konsisten
          items: statuses.asMap().entries.map((entry) {
            final i = entry.key;
            final s = entry.value;
            final isLast = i == statuses.length - 1;

            return DropdownMenuItem<String>(
              value: s.paymentStatusId,
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(kInset, 10, kInset, 10),
                  decoration: !isLast
                      ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0), width: 0.8),
                    ),
                  )
                      : null,
                  child: Text(
                    s.paymentStatusName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }
}
