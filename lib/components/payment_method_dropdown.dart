import 'package:flutter/material.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../models/payment_method.dart';

class PaymentMethodDropdown extends StatelessWidget {
  final String? selectedId;
  final List<PaymentMethod> methods;
  final ValueChanged<String?> onChanged;

  const PaymentMethodDropdown({
    super.key,
    required this.selectedId,
    required this.methods,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double kInset = 8.0; // ⬅️ satu sumber padding kiri/kanan
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Pembayaran',
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
          isExpanded: true,
          dropdownColor: Colors.white,
          menuMaxHeight: 360,
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.white,
            hintText: 'Pilih metode pembayaran',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: kInset,  // ⬅️ sejajarkan kiri/kanan field
              vertical: 4,
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

          selectedItemBuilder: (context) => methods.map((pm) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                pm.paymentMethodName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: GlobalFonts.fontFamilyJakarta,
                  color: GlobalColors.mainTextBlack,
                ),
              ),
            );
          }).toList(),

          items: methods.asMap().entries.map((entry) {
            final i = entry.key;
            final pm = entry.value;
            final isLast = i == methods.length - 1;

            return DropdownMenuItem<String>(
              value: pm.paymentMethodId,
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    kInset, 10, kInset, 10, // ⬅️ sejajarkan kiri/kanan popup
                  ),
                  decoration: !isLast
                      ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0), width: 0.8),
                    ),
                  )
                      : null,
                  child: Text(
                    pm.paymentMethodName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontFamily: GlobalFonts.fontFamilyJakarta),
                  ),
                ),
              ),
            );
          }).toList(),

          onChanged: onChanged,
        )

      ],
    );
  }
}
