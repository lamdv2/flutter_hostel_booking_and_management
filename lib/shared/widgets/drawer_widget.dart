import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../modules/main/home_controller.dart';
import '../../modules/profile/edit_profile.dart';
import '../../modules/profile/profile_controller.dart';
import '../constants/colors.dart';
import '../utils/size_utils.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    super.key,
  });

  final HomeController homeController = Get.find();
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .7,
      backgroundColor: appController.isDarkModeOn.value
          ? ColorConstants.darkBackground
          : ColorConstants.lightBackground,
      child: Column(
        children: [
          SizedBox(
            height: getSize(16 + MediaQuery.of(context).padding.top),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                  top: 16,
                ),
                child: SvgPicture.asset(
                  ImageConstant.icoNextLeft,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getSize(16),
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.icProfile,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
                SizedBox(
                  width: getSize(24),
                ),
                Text(
                  CommonConstants.profile.tr,
                  style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Get.toNamed(Routes.PROFILE);
            },
          ),
          Divider(
            thickness: 0.5,
            color: appController.isDarkModeOn.value
                ? ColorConstants.gray300
                : ColorConstants.black.withOpacity(0.8),
            indent: 16,
            endIndent: 80,
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.icBag,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
                SizedBox(
                  width: getSize(24),
                ),
                Text(
                  CommonConstants.booking.tr,
                  style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {
              Get.back();
            },
          ),
          Divider(
            thickness: 0.5,
            color: appController.isDarkModeOn.value
                ? ColorConstants.gray300
                : ColorConstants.black.withOpacity(0.8),
            indent: 16,
            endIndent: 80,
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.icHeart,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
                SizedBox(
                  width: getSize(24),
                ),
                Text(
                  CommonConstants.favorite.tr,
                  style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Get.toNamed(Routes.FAVORITE);
            },
          ),
          Divider(
            thickness: 0.5,
            color: appController.isDarkModeOn.value
                ? ColorConstants.gray300
                : ColorConstants.black.withOpacity(0.8),
            indent: 16,
            endIndent: 80,
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.icDocument,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
                SizedBox(
                  width: getSize(24),
                ),
                Text(
                  CommonConstants.history.tr,
                  style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Get.toNamed(Routes.HISTORY_TOUR_SCREEN);
            },
          ),
          Divider(
            thickness: 0.5,
            color: appController.isDarkModeOn.value
                ? ColorConstants.gray300
                : ColorConstants.black.withOpacity(0.8),
            indent: 16,
            endIndent: 80,
          ),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.icWallet,
                  colorFilter: ColorFilter.mode(
                    appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    BlendMode.srcIn,
                  ),
                  width: getSize(22),
                  height: getSize(22),
                ),
                SizedBox(
                  width: getSize(24),
                ),
                Text(
                  CommonConstants.hostel.tr,
                  style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Get.toNamed(Routes.TOUR);
            },
          ),
          Divider(
            thickness: 0.5,
            color: appController.isDarkModeOn.value
                ? ColorConstants.gray300
                : ColorConstants.black.withOpacity(0.8),
            indent: 16,
            endIndent: 80,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              profileController.signUserOut(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: appController.isDarkModeOn.value
                              ? ColorConstants.gray300
                              : ColorConstants.black.withOpacity(0.8),
                          width: 1,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: getSize(8)),
                    child: Text(
                      CommonConstants.logout.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.gray300
                            : ColorConstants.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Image.asset(
                    ImageConstant.icoLogout,
                    color: appController.isDarkModeOn.value
                        ? ColorConstants.gray300
                        : ColorConstants.gray200,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
