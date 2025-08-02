import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapps/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    debugPrint("[AuthGuard] Checking login state...");

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLogin') ?? false;

    if (isLoggedIn) {
      debugPrint("[AuthGuard] ✅ Logged in. Allowing navigation.");
      resolver.next();
    } else {
      debugPrint("[AuthGuard] ❌ Not logged in. Clearing session & redirecting.");
      await prefs.remove('isLogin');
      await prefs.remove('accessToken');
      await prefs.remove('currentUser');

      router.replaceAll([const LoginRoute()]);
    }
  }
}
