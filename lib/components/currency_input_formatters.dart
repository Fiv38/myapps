import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Formats input as Indonesian‐style currency without the symbol:
///   20000 → 20.000
class CurrencyInputFormatter extends TextInputFormatter {
  final _formatter = NumberFormat('#,##0', 'id_ID');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Strip out anything that’s not a digit
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return newValue.copyWith(text: '');

    // Parse and re‐format
    final number = int.parse(digits);
    final newText = _formatter.format(number);

    // Keep the cursor at the end
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
