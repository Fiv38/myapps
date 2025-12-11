import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:myapps/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_client.dart';
import '../../../models/orders.dart';

part 'customer_event.dart';
part 'customer_state.dart';
part 'customer_bloc.freezed.dart';

final sl = GetIt.instance;
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final TextEditingController searchController = TextEditingController();

  int _searchSeq = 0; // 👈 penanda sesi search aktif

  // Store prefs
  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String userBranch = '';
  String roleName = '';
  String branchName = '';
  String branchAddress = '';
  String fcmToken = '';
  bool isLogin = false;

  // Customer Lists
  List<User> allUser = [];
  List<User> filteredUser = [];

  CustomerBloc() : super(const CustomerState.initial()) {
    on<_Started>(_onStarted);
    on<_GetAllCustomer>(_onGetAllCustomer);
    on<_FilterCustomer>(_onFilterCustomer);
    on<_Rebuild>(_onRebuildFunc);
  }

  void _onRebuildFunc(_Rebuild event, Emitter<CustomerState> emit) async {
    emit(const CustomerState.loaded());
  }

  Future<void> _onStarted(_Started event, Emitter<CustomerState> emit) async {
    emit(const CustomerState.loading());

    final prefs = await sl.getAsync<SharedPreferences>();
    userId        = prefs.getString('userId')        ?? '';
    userName      = prefs.getString('userName')      ?? '';
    userPhone     = prefs.getString('userPhone')     ?? '';
    userAddress   = prefs.getString('userAddress')   ?? '';
    branchName    = prefs.getString('branchName')    ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    roleName      = prefs.getString('roleName')      ?? '';
    isLogin       = prefs.getBool('isLogin')         ?? false;
    fcmToken      = prefs.getString('fcmToken')      ?? '';

    add(const CustomerEvent.getAllCustomer());
  }

  Future<void> _onGetAllCustomer(_GetAllCustomer event, Emitter<CustomerState> emit) async {
    emit(const CustomerState.loading());

    try {
      final raw = await sl<APIClient>().fetchAllUsersWithDio();

      if (!raw.status || raw.data == null) {
        emit(CustomerState.error(raw.message));
        return;
      }

      allUser = (raw.data as List)
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();

      filteredUser = List.from(allUser);

      // ✅ pastikan shimmer tampil minimal 1 detik
      await Future.delayed(const Duration(seconds: 1));

      emit(const CustomerState.loaded());
    } catch (e) {
      emit(CustomerState.error("Failed to fetch users: $e"));
    }
  }

  Future<void> _onFilterCustomer(_FilterCustomer event, Emitter<CustomerState> emit) async {
    final int mySeq = ++_searchSeq; // 👈 seq sesi ini
    emit(const CustomerState.loading()); // tampilkan shimmer

    final q = event.query.toLowerCase();
    final newFiltered = allUser.where((u) =>
    u.userName.toLowerCase().contains(q) ||
        u.userPhone.toLowerCase().contains(q)
    ).toList();

    // delay 1 detik agar shimmer keliatan (debounce di UI tetap jalan)
    await Future.delayed(const Duration(seconds: 1));

    // jika selama nunggu ada search baru, jangan timpa hasil terbaru
    if (mySeq != _searchSeq) return;

    filteredUser = newFiltered;
    emit(const CustomerState.loaded());
  }


}


