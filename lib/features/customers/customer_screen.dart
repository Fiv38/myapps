import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../components/custom_card_separate.dart';
import '../../components/custom_search_field.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import 'bloc/customer_bloc.dart';

@RoutePage()
class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerBloc>(
      create: (context) => CustomerBloc()..add(const CustomerEvent.started()),
      child: const CustomerScreenView(),
    );
  }
}

class CustomerScreenView extends StatefulWidget {
  const CustomerScreenView({super.key});

  @override
  State<CustomerScreenView> createState() => _CustomerScreenViewState();
}

class _CustomerScreenViewState extends State<CustomerScreenView> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(CustomerBloc bloc, String val) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      bloc.add(CustomerEvent.filterCustomer(val));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CustomerBloc>();

    return BlocListener<CustomerBloc, CustomerState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (msg) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg))),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: GlobalColors.mainTextBlack),
          title: Text(
            "Customer",
            style: TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontWeight: FontWeight.w600,
              color: GlobalColors.mainTextBlack,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomSearchField(
                controller: bloc.searchController,
                hintText: 'Search customer...',
                leftIcon: Icons.person,
                rightIcon: Icons.close,
                onChanged: (val) => _onSearchChanged(bloc, val),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );

                    if (isLoading) {
                      return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        bloc.add(const CustomerEvent.getAllCustomer());
                      },
                      child: bloc.filteredUser.isEmpty
                          ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 100),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.search_off,
                                    size: 64, color: Colors.grey),
                                SizedBox(height: 8),
                                Text(
                                  "No customer found",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : ListView.separated(
                        itemCount: bloc.filteredUser.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final user = bloc.filteredUser[index];
                          return CustomCardSeparate(
                            title: user.userName,
                            detail: user.userPhone,
                            rightIcon: Icons.arrow_forward_ios,
                            titleStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GlobalFonts.fontFamilyJakarta,
                              fontSize: 14,
                            ),
                            detailStyle: TextStyle(
                              fontFamily:
                              GlobalFonts.fontFamilyJakarta,
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
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
      ),
    );
  }
}
