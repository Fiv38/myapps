import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../features/customers/bloc/customer_bloc.dart';
import '../models/user.dart';

/// Dialog pemilih customer.
/// Mengembalikan `User` jika dipilih, atau `null` jika ditutup/tidak ada yang dipilih.
/// Tidak ada fitur tambah dari dialog (sesuai requirement).
Future<User?> showCustomerPickerDialog(
    BuildContext context, {
      String title = 'Find Customer',
      bool barrierDismissible = true,
    }) {
  return showDialog<User>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogCtx) {
      return BlocProvider(
        create: (_) => CustomerBloc()..add(const CustomerEvent.started()),
        child: _CustomerPickerDialog(title: title),
      );
    },
  );
}

class _CustomerPickerDialog extends StatefulWidget {
  final String title;
  const _CustomerPickerDialog({Key? key, required this.title}) : super(key: key);

  @override
  State<_CustomerPickerDialog> createState() => _CustomerPickerDialogState();
}

class _CustomerPickerDialogState extends State<_CustomerPickerDialog> {
  final _searchTEC = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchTEC.dispose();
    super.dispose();
  }

  void _onChanged(CustomerBloc bloc, String val) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      bloc.add(CustomerEvent.filterCustomer(val));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CustomerBloc>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 8),

      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),

      content: SizedBox(
        width: 520,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search
            TextField(
              controller: _searchTEC,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search name / phone",
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10,
                ),
                suffixIcon: (_searchTEC.text.isNotEmpty)
                    ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _searchTEC.clear();
                    bloc.add(const CustomerEvent.filterCustomer(""));
                    setState(() {});
                  },
                )
                    : null,
              ),
              onChanged: (v) {
                setState(() {}); // refresh suffixIcon
                _onChanged(bloc, v);
              },
            ),
            const SizedBox(height: 12),

            // List
            SizedBox(
              height: 420,
              width: double.maxFinite,
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  if (isLoading) {
                    return ListView.builder(
                      itemCount: 8,
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  final list = bloc.filteredUser;
                  if (list.isEmpty) {
                    // Tidak bisa tambah dari dialog—isi manual kalau tak ketemu
                    return RefreshIndicator(
                      onRefresh: () async =>
                          bloc.add(const CustomerEvent.getAllCustomer()),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 120),
                          Icon(Icons.search_off, size: 64, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            "No customer found\nPlease input manually in the form.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async =>
                        bloc.add(const CustomerEvent.getAllCustomer()),
                    child: ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, i) {
                        final u = list[i];
                        final address = (u.userAddress ?? '').trim();
                        final phone   = (u.userPhone   ?? '').trim();

                        return ListTile(
                          leading: const CircleAvatar(
                            radius: 18,
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            u.userName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (address.isNotEmpty)
                                Text(address, maxLines: 1, overflow: TextOverflow.ellipsis),
                              if (phone.isNotEmpty)
                                Text(phone, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          onTap: () => Navigator.of(context).pop<User>(u),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
