import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:get/get.dart';

import '../../shared/constants/local_storage.dart';

class MessageController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 4));
    await LocalStorageHelper.initLocalStorageHelper();

    final checkIntroScreen =
        LocalStorageHelper.getValue(CommonConstants.checkIntro) as bool?;

    try {
      if (checkIntroScreen != null && checkIntroScreen) {
        Get.offNamed(Routes.AUTH);
      } else {
        LocalStorageHelper.setValue(CommonConstants.checkIntro, true);
        Get.offNamed(Routes.INTRO);
      }
    } catch (e) {
      Get.offNamed(Routes.INTRO);
    }
  }
}
