// lib/utils/date_filter_option.dart

enum DateFilterOption {
  today,
  thisWeek,
  thisMonth,
}

extension DateFilterOptionLabel on DateFilterOption {
  String get label {
    switch (this) {
      case DateFilterOption.today:
        return "Hari Ini";
      case DateFilterOption.thisWeek:
        return "Minggu Ini";
      case DateFilterOption.thisMonth:
        return "Bulan Ini";
    }
  }
}
