import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/four_rotating_dots_custom.dart';
import '../../utils/theme/global_colors.dart';
import 'package:myapps/routes/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  String statusText = "Getting things ready...";

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    // Delay heavy logic post-frame
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/maxclean/logo_max_clean.jpeg'), context);
  }


  Future<void> _initializeApp() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin') ?? false;

    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() => statusText = "Almost there...");

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => statusText = "Done.");

    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;

    context.router.replace(isLogin ? const HomeRoute() : const LoginRoute());
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/maxclean/logo_max_clean.jpeg',
                    width: 100,
                  ),
                  const SizedBox(height: 20),
                  RepaintBoundary(
                    child: FourRotatingDots(
                      size: 60,
                      color: Colors.grey,
                      colors: const [
                        GlobalColors.primaryBlue,
                        GlobalColors.secondaryBlue,
                        GlobalColors.accentSky,
                        GlobalColors.softGray,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              statusText,
              style: const TextStyle(
                fontSize: 14,
                color: GlobalColors.mainTextBlack,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
