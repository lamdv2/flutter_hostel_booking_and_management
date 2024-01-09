import 'package:flutter_getx_base/modules/auth/auth_controller.dart';
import 'package:flutter_getx_base/modules/auth/user_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
  }
}
