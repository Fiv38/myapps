import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapps/routes/app_router.dart';
import 'package:myapps/di/injection_container.dart';

class APIInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('[DIO] REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('[DIO] RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('[DIO] ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      await _handleUnauthorized();
    }
    super.onError(err, handler);
  }

  Future<void> _handleUnauthorized() async {
    final prefs = await SharedPreferences.getInstance();

    // Hanya hapus data login, bukan semuanya
    await prefs.remove("isLogin");
    await prefs.remove("userName");
    await prefs.remove("accessToken");

    // Arahkan ke halaman login (pastikan AppRouter sudah siap)
    try {
      final appRouter = sl.get<AppRouter>();
      appRouter.replaceNamed("/");
    } catch (e) {
      debugPrint('[DIO] Navigation to login failed: $e');
    }
  }
}
