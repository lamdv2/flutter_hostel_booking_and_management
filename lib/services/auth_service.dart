import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user/user_model.dart';
import '../modules/auth/user_controller.dart';
import '../modules/main/home_controller.dart';
import '../modules/profile/profile_controller.dart';
import '../shared/constants/common.dart';
import '../shared/constants/local_storage.dart';

class AuthService {
  final ProfileController profileController = Get.find();

  final UserController userController = Get.find();

  final HomeController homeController = Get.find();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = authResult.user;

      if (user != null) {
        final existingUser =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(user.email!);

        if (existingUser.isEmpty) {
          if (!await profileController.isCheckExist(user.email ?? '')) {
            final UserModel userModel = UserModel(
              id: user.uid,
              email: user.email ?? "",
              passWord: "",
              phoneNub: "",
              isActive: true,
            );
            profileController.createUser(userModel);
          }
        }
      }

      await homeController.getUserDetails(user?.email ?? '');
      final fcmTokenGet = LocalStorageHelper.getValue('fcmToken') ?? "";
      profileController.createPushNotification(
        homeController.userModel.value?.id ?? "",
        fcmTokenGet,
      );

      Get.toNamed(Routes.HOME);

      return user;
    } catch (error) {
      Get.snackbar(CommonConstants.errorSigningInWithGoogle.tr, '$error');
      return null;
    }
  }
}
