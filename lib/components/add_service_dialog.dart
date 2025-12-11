import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_textfield.dart';
import '../../models/laundry_types.dart';
import '../../utils/currency_format.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';

typedef OnSaveService = void Function({
required LaundryType type,
required int qty,
required String note,
required double price,
});

Future<void> showAddServiceDialog({
  required BuildContext context,
  required List<LaundryType> types,
  required OnSaveService onSave,
}) async {
  final qtyController = TextEditingController();
  final noteController = TextEditingController();
  final priceController = TextEditingController();
  LaundryType? selectedType;

  await showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          backgroundColor: GlobalColors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.9),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Service",
                          style: TextStyle(
                            fontFamily: GlobalFonts.fontFamilyJakarta,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          "Laundry Type",
                          style: TextStyle(
                            fontFamily: GlobalFonts.fontFamilyJakarta,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedType?.laundryTypeId,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: GlobalColors.white.withOpacity(0.15),
                            hintText: 'Choose laundry type',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: GlobalColors.grey, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: GlobalColors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: GlobalColors.grey, width: 1.5),
                            ),
                          ),
                          items: types
                              .map((type) => DropdownMenuItem(
                            value: type.laundryTypeId,
                            child: Text(type.laundryTypeName),
                          ))
                              .toList(),
                          onChanged: (val) {
                            if (val == null) return;
                            setState(() {
                              selectedType = types.firstWhere((t) => t.laundryTypeId == val);
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        CustomTextField(
                          title: 'Quantity',
                          controller: qtyController,
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.format_list_numbered),
                        ),
                        const SizedBox(height: 16),

                        CustomTextField(
                          title: 'Keterangan',
                          controller: noteController,
                          prefixIcon: const Icon(Icons.note),
                        ),
                        const SizedBox(height: 16),

                        CustomTextField(
                          title: 'Unit Price',
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.attach_money),
                          hintText: 'Rp. xxx.xxx.xxx',
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TextInputFormatter.withFunction(CurrencyFormat.formatRupiahOnEdit),
                          ],
                        ),
                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElevatedButton(
                              label: 'Cancel',
                              onPressed: () => Navigator.pop(context),
                              width: 100,
                              height: 50,
                              gradient: LinearGradient(
                                colors: [Colors.red.shade700, Colors.redAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderColor: Colors.red,
                              textColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 10,
                            ),
                            const SizedBox(width: 12),
                            CustomElevatedButton(
                              label: 'Save',
                              onPressed: () {
                                if (selectedType == null) {
                                  ToastUtils.showFailure(context, message: "Please pick a laundry type");
                                  return;
                                }
                                if (qtyController.text.isEmpty || int.tryParse(qtyController.text) == null) {
                                  ToastUtils.showFailure(context, message: "Enter a valid quantity");
                                  return;
                                }
                                final price = double.tryParse(
                                  priceController.text.replaceAll(RegExp(r'[^0-9]'), ''),
                                );
                                if (price == null) {
                                  ToastUtils.showFailure(context, message: "Enter a valid price");
                                  return;
                                }

                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();

                                onSave(
                                  type: selectedType!,
                                  qty: int.parse(qtyController.text),
                                  note: noteController.text,
                                  price: price,
                                );
                                Navigator.pop(context);
                              },
                              width: 100,
                              height: 50,
                              gradient: LinearGradient(
                                colors: [Colors.green.shade700, Colors.lightGreen],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              textColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
