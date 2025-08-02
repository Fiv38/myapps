import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/custom_text.dart';
import '../../utils/toast_utils.dart';
import '../features/pos/bloc/pos_bloc.dart';

class AddServiceForm extends StatelessWidget {
  final PosBloc bloc;
  final void Function()? onSubmit;

  const AddServiceForm({
    super.key,
    required this.bloc,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final list = bloc.listLaundryType;

    return BlocListener<PosBloc, PosState>(
      listener: (context, state) {
        state.maybeWhen(
          loadingService: () {
            ToastUtils.showInfo(context, message: "Loading service...");
          },
          addedService: () {
            ToastUtils.showSuccess(context, message: "Service Added");
            Navigator.pop(context);
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
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
                );
              }).toList(),
              onChanged: (val) {
                debugPrint("Selected Laundry Type ID: $val");
              },
              hint: const Text("Choose laundry type"),
            ),
            const SizedBox(height: 16),
            CustomText(
              title: "Quantity",
              hintText: "Enter quantity",
              keyboardType: TextInputType.number,
              onChanged: (val) {
                debugPrint("Quantity: $val");
              },
            ),
            const SizedBox(height: 16),
            CustomText(
              title: "Keterangan",
              hintText: "Enter note",
              keyboardType: TextInputType.text,
              onChanged: (val) {
                debugPrint("Keterangan: $val");
              },
            ),
          ],
        ),
      ),
    );
  }
}
