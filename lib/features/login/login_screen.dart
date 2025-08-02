import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/loading_dialog.dart';
import '../../components/custom_textfield.dart';
import '../../routes/app_router.gr.dart';
import '../../services/connection_service.dart';
import '../../utils/double_back_exit.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';
import 'bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) {
        final bloc = LoginBloc();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          bloc.add(const LoginEvent.started());
        });
        return bloc;
      },
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/images/google.png'), context);
    RepaintBoundary(
      child: SvgPicture.asset("assets/icons/username.svg", width: 20),
    );
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          valid: () async {
            await Future.delayed(const Duration(milliseconds: 2500));
            ToastUtils.showSuccess(context, message: "Login successful!");
            Navigator.pop(context);
            if (context.mounted) {
              context.router.replace(const HomeRoute());
            }
          },
          loading: () => loadingDialog(context, isHideAfterSeconds: false),
          invalid: (message, isCloseLoading) async {
            await Future.delayed(const Duration(milliseconds: 2500));
            if (isCloseLoading) Navigator.pop(context);
            ToastUtils.showFailure(context, message: message);
          },
          error: (message) async {
            await Future.delayed(const Duration(milliseconds: 2500));
            Navigator.pop(context);
            ToastUtils.showFailure(context, message: message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/maxclean/backgroundd.png'),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          child: SafeArea(
            child: DoubleBackExit(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 250,
                            child: Lottie.asset("assets/anims/login_anim.json"),
                          ),
                          const SizedBox(height: 10),
                          Material(
                            elevation: 20,
                            color: GlobalColors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: GlobalColors.mainTextBlack,
                                      fontFamily: GlobalFonts.fontFamilyJakarta,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Silahkan login menggunakan akun yang telah terdaftar',
                                    style: TextStyle(
                                      color: GlobalColors.grey.withOpacity(0.9),
                                      fontFamily: GlobalFonts.fontFamilyJakarta,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  CustomTextField(
                                    title: "Phone Number",
                                    hintText: "ex. 0878********...",
                                    isRequired: true,
                                    textInputAction: TextInputAction.next,
                                    maxLength: 16,
                                    errorText: bloc.usernameError,
                                    controller: bloc.usernameTEC,
                                    keyboardType: TextInputType.phone,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: SvgPicture.asset(
                                        "assets/icons/username.svg",
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  CustomElevatedButton(
                                    label: "Proceed To Login",
                                    gradient: const LinearGradient(
                                      colors: [GlobalColors.primaryBlue, GlobalColors.accentSky],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    onPressed: () async {
                                      final hasInternet = await NetworkUtils.isConnected();
                                      if (!hasInternet) {
                                        ToastUtils.showFailure(context, message: "No Internet Connection");
                                        return;
                                      }
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      bloc.add(const LoginEvent.submitlogin());
                                    },
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: const [
                                      Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text("OR",
                                            style: TextStyle(
                                              fontFamily: GlobalFonts.fontFamilyJakarta,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.grey,
                                            )),
                                      ),
                                      Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  CustomElevatedButton(
                                    label: "Sign in with Google",
                                    icon: Image.asset('assets/images/google.png', height: 24, width: 24),
                                    textColor: GlobalColors.mainTextBlack,
                                    outlined: true,
                                    gradient: const LinearGradient(
                                      colors: [GlobalColors.primaryBlue, GlobalColors.accentSky],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    onPressed: () {
                                      // TODO: Implement Google Sign-In
                                    },
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: GlobalColors.mainTextBlack,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                        ),
                        children: const [
                          TextSpan(text: 'All rights reserved © 2025 by '),
                          TextSpan(
                            text: 'MaxClean',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GlobalColors.mainTextBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
