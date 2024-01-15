// ignore_for_file: use_super_parameters

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/app_style.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_utils.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/drawer_widget.dart';
import '../../shared/widgets/profile_widget.dart';
import '../auth/user_controller.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController = Get.find();
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    profileController.getThumbnails();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: CustomAppBar(
        onTap: () {
          Get.back();
        },
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.darkAppBar
            : ColorConstants.primaryColor,
      ),
      body: Obx(
        () => Scaffold(
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
                    height: getSize(8),
                  ),
                  Text(
                    CommonConstants.myProfile.tr,
                    style: TextStyle(
                      fontSize: 36,
                      color: appController.isDarkModeOn.value
                          ? ColorConstants.white
                          : ColorConstants.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: getSize(28),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CommonConstants.personalDetail.tr,
                        style: AppStyles.black000Size20Fw500FfMont.copyWith(
                            color: appController.isDarkModeOn.value
                                ? ColorConstants.white
                                : ColorConstants.black),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EDIT_PROFILE);
                        },
                        child: Text(
                          CommonConstants.change.tr,
                          style: AppStyles.black000Size16Fw400FfMont.copyWith(
                            color: appController.isDarkModeOn.value
                                ? ColorConstants.gray400
                                : ColorConstants.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(24),
                  ),
                  ProfileWidget(
                    userController: userController,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getSize(16)),
                    ),
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 24,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                "${profileController.userModelImg.value?.length ?? 0}",
                                style: TextStyle(
                                  color: appController.isDarkModeOn.value
                                      ? ColorConstants.white
                                      : ColorConstants.black.withOpacity(0.8),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Video".tr,
                              style: TextStyle(
                                color: appController.isDarkModeOn.value
                                    ? ColorConstants.white
                                    : ColorConstants.black.withOpacity(0.4),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: appController.isDarkModeOn.value
                                      ? ColorConstants.white
                                      : ColorConstants.black.withOpacity(0.8),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                CommonConstants.followers.tr,
                                style: TextStyle(
                                  color: appController.isDarkModeOn.value
                                      ? ColorConstants.white
                                      : ColorConstants.black.withOpacity(0.4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: appController.isDarkModeOn.value
                                      ? ColorConstants.white
                                      : ColorConstants.black.withOpacity(0.8),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                CommonConstants.following.tr,
                                style: TextStyle(
                                  color: appController.isDarkModeOn.value
                                      ? ColorConstants.white
                                      : ColorConstants.black.withOpacity(0.4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            profileController.userModelImg.value?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: getSize(8),
                          mainAxisSpacing: getSize(8),
                        ),
                        itemBuilder: (context, index) {
                          String thumbnail =
                              profileController.userModelImg.value![index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(getSize(8)),
                            child: CachedNetworkImage(
                              imageUrl: thumbnail,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
