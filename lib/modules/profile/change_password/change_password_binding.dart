import 'package:get/get.dart';

import '../profile_controller.dart';
import 'change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
    Get.lazyPut(() => ProfileController());
  }
}
