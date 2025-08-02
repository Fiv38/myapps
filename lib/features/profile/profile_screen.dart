import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.gr.dart';
import 'bloc/profile_bloc.dart'; // Change this to your actual profile bloc

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc()..add(const ProfileEvent.started()),
      child: const ProfileScreenView(),
    );
  }
}

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileBloc bloc = context.read<ProfileBloc>();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

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
                      // ✅ Back Button
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () {
                            context.router.pop(); // Navigate back
                          },
                        ),
                      ),
                      SizedBox(height: 10),

                      // ✅ Profile Image Section
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, size: 50, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),

                      // ✅ Profile Title
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Manage your account',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),

                      // ✅ Name Input Field
                      TextField(
                        controller: nameController,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your name',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // ✅ Email Input Field
                      TextField(
                        controller: emailController,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // ✅ Phone Input Field
                      TextField(
                        controller: phoneController,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // ✅ Update Profile Button
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
                              'Update Profile',
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

                      // ✅ Logout Button
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            context.router.pushAndPopUntil(
                              const HomeRoute(),
                              predicate: (route) => false, // Removes all previous screens
                            );
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ✅ Footer
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
