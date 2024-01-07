import 'package:flutter_getx_base/modules/setting/setting.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
