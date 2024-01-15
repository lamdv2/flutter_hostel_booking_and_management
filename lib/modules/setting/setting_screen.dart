import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/home_controller.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:flutter_getx_base/shared/widgets/app_bar_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app_controller.dart';
import '../../lang/language.dart';
import '../../lang/translation_service.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/app_style.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/common.dart';
import '../../shared/utils/size_utils.dart';
import '../../shared/widgets/profile_widget.dart';
import '../../shared/widgets/user_profile_setting_groups.dart';
import '../../shared/widgets/user_profile_setting_item.dart';
import '../auth/user_controller.dart';
import '../profile/profile_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final UserController userController = Get.find();

  final AppController appController = Get.find();

  final ProfileController profileController = Get.find();

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          titles: "Setting",
          onTap: () {
            if (homeController.bottomNavIndex.value != 0) {
              homeController.bottomNavIndex.value = 0;
              return false;
            }
            return true;
          },
        ),
        extendBody: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.darkBackground
            : ColorConstants.lightBackground,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(getSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getSize(32),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.PROFILE),
                  child: ProfileWidget(
                    userController: userController,
                  ),
                ),
                SizedBox(
                  height: getSize(32),
                ),
                BuildSettingsGroup(
                  settingsGroupTitle: CommonConstants.appSetting.tr,
                  items: [
                    BuildSettingsItem(
                      onTap: () => Get.toNamed(Routes.PROFILE),
                      imageAsset: ImageConstant.icProfile,
                      widgetTitle: Text(
                        CommonConstants.personalInformation.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BuildSettingsItem(
                      onTap: () {},
                      imageAsset: ImageConstant.icNotification,
                      widgetTitle: Text(
                        CommonConstants.notificationAndChat.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BuildSettingsItem(
                      onTap: () => openAppSettings(),
                      imageAsset: ImageConstant.icShieldDone,
                      widgetTitle: Text(
                        CommonConstants.privateAndPermissions.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BuildSettingsItem(
                      // onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD_SCREEN),
                      imageAsset: ImageConstant.icLock,
                      widgetTitle: Text(
                        CommonConstants.passwordAndAccount.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                BuildSettingsGroup(
                  settingsGroupTitle: CommonConstants.settingSystem.tr,
                  items: [
                    BuildSettingsItem(
                      imageAsset: ImageConstant.icSetting,
                      widgetTitle: Text(
                        CommonConstants.changeLanguage.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: SizedBox(
                        width: getSize(36),
                        height: getSize(36),
                        child: Card(
                          color: ColorConstants.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          elevation: 3.0,
                          child: SpeedDial(
                            icon: Icons.language,
                            direction: SpeedDialDirection.up,
                            curve: Curves.bounceOut,
                            animatedIconTheme: const IconThemeData(size: 12.0),
                            backgroundColor: ColorConstants.primaryColor,
                            foregroundColor: ColorConstants.white,
                            children: _buildLanguageOptions(),
                          ),
                        ),
                      ),
                    ),
                    BuildSettingsItem(
                      imageAsset: ImageConstant.icDarkMode,
                      widgetTitle: Text(
                        CommonConstants.darkMode.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Obx(
                        () => Switch(
                          value: appController.isDarkModeOn.value,
                          activeTrackColor: ColorConstants.accent1,
                          activeColor: appController.isDarkModeOn.value
                              ? Colors.white
                              : Colors.lightBlue,
                          onChanged: (value) {
                            appController.toggleDarkMode();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                BuildSettingsGroup(
                  settingsGroupTitle: CommonConstants.more.tr,
                  items: [
                    BuildSettingsItem(
                      imageAsset: ImageConstant.icDocument,
                      widgetTitle: Text(
                        CommonConstants.guide.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BuildSettingsItem(
                      // onTap: () => Get.toNamed(Routes.FEED_BACK),
                      imageAsset: ImageConstant.icEditSquare,
                      widgetTitle: Text(
                        CommonConstants.feedback.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BuildSettingsItem(
                      // onTap: () => Get.toNamed(Routes.ABOUT_APP_SCREEN),
                      imageAsset: ImageConstant.icInfoSquare,
                      widgetTitle: Text(
                        CommonConstants.about.tr,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.lightDarkModeSize16Fw500FfMont
                            : AppStyles.gray600Size16Fw500FfMont,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => profileController.signUserOut(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        CommonConstants.logout.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.white000Size16Fw500FfMont
                            : AppStyles.black000Size16Fw500FfMont,
                      ),
                      SizedBox(
                        width: getSize(16),
                      ),
                      Image.asset(
                        ImageConstant.icoLogout,
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.grey800,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getSize(96),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _selectedLanguage = Language(1, "🇺🇸", "English", "en").obs;

  Language get selectedLanguage => _selectedLanguage.value;

  void handleLanguageSelection(Language? language) {
    if (language != null) {
      _selectedLanguage.value = language;
      String code = language.code;

      if (code == 'vi') {
        TranslationService.changeLocale('vi');
      } else if (code == 'en') {
        TranslationService.changeLocale('en');
      } else if (code == 'cn') {
        TranslationService.changeLocale('cn');
      }
    }
  }

  List<SpeedDialChild> _buildLanguageOptions() {
    return [
      _buildLanguageOption('🇺🇸 English', 'en'),
      _buildLanguageOption('🇨🇳 China', 'cn'),
      _buildLanguageOption('🇻🇳 Vietnamese', 'vi'),
    ];
  }

  SpeedDialChild _buildLanguageOption(String label, String locale) {
    return SpeedDialChild(
      backgroundColor: ColorConstants.blue,
      label: label,
      onTap: () {
        TranslationService.changeLocale(locale);
      },
    );
  }
}
