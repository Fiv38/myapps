import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../api/api_client.dart';
import '../api/api_config.dart';
import '../api/api_interceptor.dart';
import '../repository/auth_repository.dart';
import '../routes/app_router.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  try {
    // Async singleton
    sl.registerSingletonAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });

    // Lazy singletons
    sl
      ..registerLazySingleton<APIConfig>(() => APIConfig())
      ..registerLazySingleton<APIInterceptors>(() => APIInterceptors())
      ..registerLazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin())
      ..registerLazySingleton<Geolocator>(() => Geolocator())
      ..registerLazySingleton<Battery>(() => Battery())
      ..registerLazySingleton<Connectivity>(() => Connectivity())
      ..registerLazySingleton<AppRouter>(() => AppRouter());

    // Wait only after registration done
    await sl.allReady();

    // APIClient after interceptors ready
    sl.registerLazySingleton<APIClient>(() {
      final client = APIClient();
      client.dio.interceptors.add(sl<APIInterceptors>());
      return client;
    });

    // AuthRepository after SharedPreferences & APIClient ready
    sl.registerLazySingleton<AuthRepository>(() {
      return AuthRepository(
        apiClient: sl<APIClient>(),
        prefs: sl<SharedPreferences>(),
      );
    });

    debugPrint("✅ All dependencies are registered.");
  } catch (e) {
    debugPrint("❌ Dependency injection failed: $e");
  }
}
