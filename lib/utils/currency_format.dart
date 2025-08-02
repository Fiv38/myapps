import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormat {
  /// e.g. CurrencyFormat.convertToIdr(1000000, 0) → "Rp. 1.000.000"
  static String convertToIdr(
      dynamic number,
      int decimalDigits, {
        bool removeSymbol = false,
      }) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: removeSymbol ? '' : 'Rp. ',
      decimalDigits: decimalDigits,
    );
    return formatter.format(number);
  }

  /// On each keystroke, strip non-digits then reformat as "Rp. X.xxx.xxx"
  static TextEditingValue formatRupiahOnEdit(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // 1) Strip everything but digits
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    // 2) Parse to int (0 if empty or invalid)
    final intValue = int.tryParse(digitsOnly) ?? 0;
    // 3) Format to Rupiah
    final formatted = convertToIdr(intValue, 0);
    // 4) Return new TextEditingValue with caret at end
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
