import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main/home_screen.dart';
import 'auth_controller.dart';
import 'login_or_register.dart';

class AuthScreen extends GetView<AuthController> {
  AuthScreen({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
      onWillPop: () async => false,
    );
  }

  Widget _buildItems(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
