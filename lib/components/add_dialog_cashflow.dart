import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/cashflow/bloc/cashflow_bloc.dart';
import '../utils/toast_utils.dart';
import 'package:intl/intl.dart';

Widget AddCashflowDialog(BuildContext context) {
  final descController = TextEditingController();
  final amountController = TextEditingController();
  int? selectedCategoryId;

  String _formatRupiah(String raw) {
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';
    final n = int.parse(digits);
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(n);
  }

  double _parseRupiah(String formatted) {
    final digits = formatted.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return 0.0;
    return double.parse(digits);
  }

  final categories = [
    {"id": 1, "name": "Bahan"},
    {"id": 2, "name": "Operasional"},
    {"id": 3, "name": "Konsumsi"},
    {"id": 4, "name": "Transportasi"},
    {"id": 5, "name": "Lain-lain"},
    {"id": 100, "name": "Pemasukan"},
  ];


  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    insetPadding: const EdgeInsets.all(24),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tambah Cashflow",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Category Dropdown
                DropdownButtonFormField<int>(
                  value: selectedCategoryId,
                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                  items: categories.map((c) => DropdownMenuItem<int>(
                    value: c["id"] as int,
                    child: Text(c["name"] as String),
                  )).toList(),
                  onChanged: (val) => setState(() => selectedCategoryId = val),
                ),
                const SizedBox(height: 12),

                // Description
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Amount (Rupiah masked)
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Jumlah (Rp)",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    final cursorPos = amountController.selection.baseOffset;
                    final formatted = _formatRupiah(value);
                    amountController.value = TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(
                        offset: formatted.length,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final desc = descController.text.trim();
                        final amt  = _parseRupiah(amountController.text);

                        if (selectedCategoryId == null) {
                          ToastUtils.showFailure(context, message: "Pilih kategori.");
                          return;
                        }
                        if (desc.isEmpty || amt <= 0) {
                          ToastUtils.showFailure(context, message: "Harap isi deskripsi dan jumlah yang valid.");
                          return;
                        }

                        context.read<CashflowBloc>().add(
                          CashflowEvent.addCashFlow(
                            categoryId: selectedCategoryId!,
                            description: desc,
                            amount: _parseRupiah(amountController.text).toInt(), // pastikan int
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Simpan"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

