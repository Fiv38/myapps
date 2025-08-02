import 'package:auto_route/auto_route.dart';
import 'package:myapps/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = await SharedPreferences.getInstance();

    final bool isConfigured = prefs.getBool('isConfigComplete') ?? false;

    // if (isConfigured) {
    //   resolver.next(); // lanjut ke page yang dituju
    // } else {
    //   // redirect ke konfigurasi awal
    //   // router.pushAndPopUntil(
    //   //   const ConfigSetupRoute(),
    //   //   predicate: (_) => false,
    //   // );
    // }
  }
}
