import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.gr.dart';
import 'bloc/register_bloc.dart'; // Change to your actual register bloc

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(const RegisterEvent.started()),
      child: const RegisterScreenView(),
    );
  }
}

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = context.read<RegisterBloc>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () {
                            context.router.pop(); // Navigate back
                          },
                        ),
                      ),
                      SizedBox(height: 10), // Add spacing below the back button
                      Text(
                        'Create an Account!',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Register to get started',
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 40),
                      TextField(
                        controller: emailController,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45, // Text color inside the field
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45, // Label color
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45, // Text color inside the field
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45, // Label color
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45, // Text color inside the field
                        ),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45, // Label color
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.lightBlueAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('OR',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/icons/icon-google/icons8-google-36.png'),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('assets/icons/icon-linkedin/icons8-linkedin-36.png'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.replace(LoginRoute()); // Navigate to RegisterRoute
                            }, // Navigate back to Login Screen
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Footer added here
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'All Reserved © Riyaldo Rio Parakasi - 2025',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
