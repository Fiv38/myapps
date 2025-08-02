import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

import '../../../api/api_client.dart';
import '../../../api/raw_response.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

final sl = GetIt.instance;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController usernameTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  // Store temporary user values
  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String fcmToken = '';
  bool isLogin = false;

  // Validation fields
  String usernameError = '';
  String passwordError = '';
  bool showPassword = false;

  String roleName = '';
  String branchName = '';
  String branchAddress = '';

  LoginBloc() : super(const LoginState.initial()) {
    on<_Started>((event, emit) async {
      emit(const LoginState.initial());
      emit(const LoginState.changePasswordVisibility()); // trigger UI update
    });

    on<_SubmitLogin>((event, emit) async {
      emit(const LoginState.loading());

      final phone = usernameTEC.text.trim();
      if (phone.isEmpty) {
        emit(const LoginState.error("Phone Number Empty/invalid."));
        return;
      }

      try {
        final response = await sl<APIClient>().fetchUserWithDio(
          phoneNumber: phone,
        );

        if (response.status) {
          final user = response.data as Map<String, dynamic>;
          final prefs = await sl.getAsync<SharedPreferences>();

          await prefs.setString('userId', user['user_id'] as String);
          await prefs.setString('userName', user['user_name'] as String);
          await prefs.setString('userPhone', user['user_phone'] as String);
          await prefs.setString('userAddress', user['user_address'] as String? ?? '');
          await prefs.setString('branchId', user['branch_id'] as String);
          // simpan roleName dari nested 'role'
          final role = user['role'] as Map<String, dynamic>?;
          if (role != null) {
            await prefs.setString('roleName', role['role_name'] as String);
          }

          // simpan branchName & branchAddress dari nested 'branches'
          final branch = user['branches'] as Map<String, dynamic>?;
          if (branch != null) {
            await prefs.setString('branchName', branch['branch_name'] as String);
            await prefs.setString('branchAddress', branch['branch_address'] as String);
          }

          await prefs.setBool('isActive', user['is_active'] as bool? ?? false);
          await prefs.setBool('isLogin', true);

          emit(const LoginState.valid());
        } else {
          emit(const LoginState.invalid(message: "Phone Number invalid!"));
        }
      } catch (e) {
        emit(const LoginState.error("Phone Number invalid!"));
      }
    });

    on<_ShowHidePassword>((event, emit) async {
      showPassword = !showPassword;
      emit(const LoginState.changePasswordVisibility());
    });

    on<_TestConnection>((event, emit) async {
      emit(const LoginState.initial());
      // Future: check API connectivity or ping
    });
  }

  // Fetch device information
  Future<void> getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final android = await deviceInfo.androidInfo;
        print('📱 Android device: ${android.model}');
      } else if (Platform.isIOS) {
        final ios = await deviceInfo.iosInfo;
        print('📱 iOS device: ${ios.utsname.machine}');
      }
    } catch (e) {
      print("Error fetching device info: $e");
    }
  }

  // Fetch the user's location
  Future<void> getLocation() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print("❌ Location permission denied");
        return;
      }

      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print('📍 Current location: ${position.latitude}, ${position.longitude}');
    } catch (e) {
      print("Error fetching location: $e");
    }
  }
}
