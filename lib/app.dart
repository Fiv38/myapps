import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapps/routes/app_router.dart';
import 'package:myapps/utils/theme/global_colors.dart';
import 'package:myapps/utils/theme/global_fonts.dart';
import '../main.dart'; // agar navigatorKey bisa diakses

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Max Clean Point Of Sales',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: GlobalColors.primaryBlue ,
        scaffoldBackgroundColor: GlobalColors.white ,
        fontFamily: GlobalFonts.fontFamilyJakarta,
        appBarTheme: AppBarTheme(
          backgroundColor: GlobalColors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: GlobalColors.primaryBlue,
            fontFamily: GlobalFonts.fontFamilyJakarta,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: GlobalColors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: GlobalColors.white,
        ),
      ),
    );
  }
}
