import 'package:get/get.dart';

import '../auth/user_controller.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
    Get.lazyPut(() => UserController());
  }
}
