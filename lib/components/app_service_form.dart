import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_text.dart';
import '../../utils/toast_utils.dart';
import '../features/pos/bloc/pos_bloc.dart';

class AddServiceForm extends StatefulWidget {
  final PosBloc bloc;
  final void Function()? onSubmit;

  const AddServiceForm({
    super.key,
    required this.bloc,
    this.onSubmit,
  });

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedTypeId;
  String _selectedTypeName = '';
  final _qtyController = TextEditingController();
  final _noteController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _qtyController.dispose();
    _noteController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  double _parsePrice() {
    final digitsOnly = _priceController.text.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(digitsOnly) ?? 0.0;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final qty = int.tryParse(_qtyController.text) ?? 0;
    final price = _parsePrice();

    if (_selectedTypeId == null) {
      ToastUtils.showFailure(context, message: "Please choose a laundry type");
      return;
    }
    if (qty <= 0) {
      ToastUtils.showFailure(context, message: "Quantity must be greater than 0");
      return;
    }
    if (price <= 0) {
      ToastUtils.showFailure(context, message: "Price must be greater than 0");
      return;
    }

    widget.bloc.add(PosEvent.addService(
      laundryTypeId: _selectedTypeId!,
      laundryTypeName: _selectedTypeName,
      qty: qty,
      note: _noteController.text.trim(),
      price: price,
    ));

    widget.onSubmit?.call();
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.bloc.listLaundryType;

    return BlocListener<PosBloc, PosState>(
      bloc: widget.bloc,
      listener: (context, state) {
        state.maybeWhen(
          serviceAdding: () {
            ToastUtils.showInfo(context, message: "Loading service...");
          },
          serviceAdded: () {
            ToastUtils.showSuccess(context, message: "Service added");
            Navigator.pop(context);
          },
          failure: (msg) {
            ToastUtils.showFailure(context, message: msg);
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Laundry Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                items: list.map((type) {
                  return DropdownMenuItem(
                    value: type.laundryTypeId,
                    child: Text(type.laundryTypeName),
                    onTap: () {
                      // simpan nama untuk dikirim ke event
                      _selectedTypeName = type.laundryTypeName;
                    },
                  );
                }).toList(),
                value: _selectedTypeId,
                onChanged: (val) {
                  setState(() {
                    _selectedTypeId = val;
                    // kalau onTap di atas tidak terpanggil (tergantung platform),
                    // fallback cari nama dari list:
                    if (val != null && _selectedTypeName.isEmpty) {
                      final t = list.firstWhere((e) => e.laundryTypeId == val);
                      _selectedTypeName = t.laundryTypeName;
                    }
                  });
                },
                hint: const Text("Choose laundry type"),
                validator: (val) => val == null ? 'Laundry type is required' : null,
              ),
              const SizedBox(height: 16),

              // Quantity
              CustomText(
                title: "Quantity",
                hintText: "Enter quantity",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _qtyController,
                validator: (val) {
                  final v = int.tryParse((val ?? '').trim());
                  if (v == null || v <= 0) return 'Quantity must be > 0';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Keterangan / Note
              CustomText(
                title: "Keterangan",
                hintText: "Enter note",
                keyboardType: TextInputType.text,
                controller: _noteController,
              ),
              const SizedBox(height: 16),

              // Unit Price
              CustomText(
                title: "Unit Price",
                hintText: "Rp. xxx.xxx.xxx",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _priceController,
                validator: (val) {
                  final p = _parsePrice();
                  if (p <= 0) return 'Price must be > 0';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Service'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
