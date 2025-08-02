// services/print_service.dart

import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class PrintService {
  // Singleton boilerplate
  static final PrintService _instance = PrintService._internal();
  factory PrintService() => _instance;
  PrintService._internal();

  final BlueThermalPrinter _printer = BlueThermalPrinter.instance;

  /// 1) Get all paired BT devices
  Future<List<BluetoothDevice>> getPairedDevices() {
    return _printer.getBondedDevices();
  }

  /// 2) Connect to a chosen device
  Future<bool> connect(BluetoothDevice device) async {
    return await _printer.connect(device);
  }

  /// 3) Print your struk
  Future<void> printStruk({
    required String orderId,
    required List<Map<String, dynamic>> items,
    required String total,
  }) async {
    final printer = BlueThermalPrinter.instance;

    // 1) Awal—bersih kertas
    printer.printNewLine();

    // 2) Header: nama & alamat
    printer.printCustom('MAX CLEAN', 3, 1);
    printer.printCustom('Jalan Contoh No.123, Jakarta', 1, 1);
    printer.printNewLine();

    // 3) Order ID
    printer.printCustom('ORDER ID: $orderId', 1, 1);
    printer.printNewLine();
    // ← separator di bawah Order ID
    printer.printCustom('-----------------------------', 1, 0);
    printer.printNewLine();

    // 4) Daftar item
    for (final item in items) {
      final service = item['service'] as String;
      final name    = item['name'] as String;
      final price   = item['price'] as String;
      final qty     = item['qty'] as int;

      // 1) Print service on its own line (if you want)
      printer.printCustom(service, 1, 0);

      // 2) Print item name & price side by side
      printer.printLeftRight(name, price, 1);

      // 3) Print the quantity indented underneath
      printer.printCustom('    x$qty', 1, 0);

      printer.printNewLine();
    }

    // 5) Separator sebelum total
    printer.printCustom('-----------------------------', 1, 0);
    printer.printNewLine();

    // 6) Total
    printer.printLeftRight('Total', total, 1);
    printer.printNewLine();

    // 7) Pesan penutup
    printer.printCustom('Sampai jumpa kembali', 1, 1);
    printer.printNewLine();
    printer.printNewLine();

    // 8) Potong kertas & disconnect
    printer.paperCut();
    await Future.delayed(const Duration(milliseconds: 500));
    await printer.disconnect();
  }




  /// 4) Disconnect when done
  Future<void> disconnect() async {
    await _printer.disconnect();
  }
}
