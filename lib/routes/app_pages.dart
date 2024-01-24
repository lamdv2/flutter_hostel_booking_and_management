import 'package:flutter_getx_base/modules/auth/auth_binding.dart';
import 'package:flutter_getx_base/modules/auth/auth_login_screen.dart';
import 'package:flutter_getx_base/modules/auth/auth_register_screen.dart';
import 'package:flutter_getx_base/modules/auth/auth_screen.dart';
import 'package:flutter_getx_base/modules/categogy/category.dart';
import 'package:flutter_getx_base/modules/home/home_tab_binding.dart';
import 'package:flutter_getx_base/modules/home/home_tab_screen.dart';
import 'package:flutter_getx_base/modules/intro/intro_screen.dart';
import 'package:flutter_getx_base/modules/main/home_binding.dart';
import 'package:flutter_getx_base/modules/main/home_screen.dart';
import 'package:flutter_getx_base/modules/profile/change_password/change_password_binding.dart';
import 'package:flutter_getx_base/modules/profile/change_password/change_password_screen.dart';
import 'package:flutter_getx_base/modules/profile/profile_screen.dart';
import 'package:flutter_getx_base/modules/splash/splash_binding.dart';
import 'package:flutter_getx_base/modules/splash/splash_view.dart';
import 'package:get/get.dart';

import '../modules/intro/intro_binding.dart';
import '../modules/profile/edit_profile.dart';
import '../modules/profile/profile_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: Routes.REGISTER,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: Routes.LOGIN,
          page: () => LoginScreen(),
        ),
      ],
    ),
    GetPage(
      name: Routes.HOME_TAB,
      page: () => HomeTabScreen(),
      binding: HomeTabBinding(),
    ),
    GetPage(
      name: Routes.CATEGORIES,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD_SCREEN,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
