import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../app_controller.dart';
import '../../models/user/user_model.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/my_button.dart';
import '../../shared/constants/my_textfield.dart';
import '../../shared/utils/regex.dart';
import '../../shared/utils/size_utils.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../auth/user_controller.dart';
import '../main/home_controller.dart';
import 'profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

final UserController userController = Get.find();
final ProfileController profileController = Get.find();
final AppController appController = Get.find();
final HomeController homeController = Get.find();

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    profileController.getEditProfile();
  }

  @override
  void deactivate() {
    super.deactivate();
    profileController.imageFonts.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: appController.isDarkModeOn.value
          ? ColorConstants.darkBackground
          : ColorConstants.lightBackground,
      appBar: CustomAppBar(
        titles: CommonConstants.changeProfile.tr,
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.darkAppBar
            : ColorConstants.primaryColor,
      ),
      body: Obx(
        () => SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getSize(24),
                    ),
                    Stack(
                      children: [
                        profileController.imageFonts.value.isNotEmpty
                            ? GestureDetector(
                                onTap: () async {
                                  File? imageFile = await profileController
                                      .imageFonts.value[0].file;
                                  String path = imageFile?.path ?? '';
                                  // ignore: use_build_context_synchronously
                                  profileController.showFullImageDialog(
                                      context, path);
                                },
                                child: CircleAvatar(
                                  radius: 64,
                                  backgroundColor: ColorConstants.white,
                                  backgroundImage: AssetEntityImageProvider(
                                    profileController.imageFonts.value[0],
                                  ),
                                ),
                              )
                            : homeController.userModel.value != null &&
                                    homeController.userModel.value?.imgAvatar !=
                                        null &&
                                    homeController.userModel.value?.imgAvatar !=
                                        ""
                                ? GestureDetector(
                                    onTap: () async {
                                      profileController.showFullImageDialog(
                                          context,
                                          homeController
                                                  .userModel.value?.imgAvatar ??
                                              "");
                                    },
                                    child: CircleAvatar(
                                      radius: 64,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        homeController
                                                .userModel.value?.imgAvatar ??
                                            "",
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundColor: ColorConstants.white,
                                    child: Container(
                                      width: getSize(96),
                                      height: getSize(96),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                            appController.isDarkModeOn.value
                                                ? ColorConstants.white
                                                : ColorConstants.accent1,
                                            BlendMode.srcIn,
                                          ),
                                          image: AssetImage(
                                            ImageConstant.icShowPassWord,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: ColorConstants.white,
                            child: IconButton(
                              onPressed: () {
                                profileController.pickImages(context);
                              },
                              icon: const Icon(Icons.add_a_photo),
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getSize(32),
                    ),
                    Text(
                      userController.userName.value,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: getSize(36),
                    ),
                    Text(
                      CommonConstants.email.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.gray200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    MyTextField(
                      controller: profileController.editEmailController,
                      hintText: CommonConstants.email.tr,
                      obscureText: false,
                      isCheckReadOnly: true,
                    ),
                    SizedBox(
                      height: getSize(36),
                    ),
                    Text(
                      CommonConstants.firstName.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.gray200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    MyTextField(
                      controller: profileController.editFirstNameController,
                      hintText: CommonConstants.enterYourFirstname.tr,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getSize(36),
                    ),
                    Text(
                      CommonConstants.lastName.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.gray200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    MyTextField(
                      controller: profileController.editLastNameController,
                      hintText: CommonConstants.enterYourLastName.tr,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getSize(36),
                    ),
                    Text(
                      CommonConstants.phoneNumber.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.gray200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    MyTextField(
                      controller: profileController.editPhoneNumberController,
                      hintText: CommonConstants.enterYourPhoneNumber.tr,
                      obscureText: false,
                      isTypeNumb: true,
                      validatorCheck: (value) {
                        if (!Regex.isPasswordNumber(value!.trim())) {
                          return 'password must contain at least one number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getSize(36),
                    ),
                    Text(
                      CommonConstants.location.tr,
                      style: TextStyle(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.lightBackground
                            : ColorConstants.gray200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    MyTextField(
                      controller: profileController.editLocationController,
                      hintText: CommonConstants.enterYourLocation.tr,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getSize(48),
                    ),
                    Center(
                      child: MyButton(
                        onTap: () async {
                          if (profileController.imageFonts.value.isNotEmpty) {
                            profileController.imageUrl.value =
                                await profileController.uploadImageToStorage(
                              'profileImage',
                              await profileController.assetEntityToUint8List(
                                profileController.imageFonts.value[0],
                              ),
                            );
                            profileController.urlImageOld.value =
                                homeController.userModel.value?.imgAvatar ?? '';

                            profileController.getDeleteImage(
                                profileController.urlImageOld.value);
                          } else if (homeController.userModel.value != null &&
                              homeController.userModel.value?.imgAvatar != "" &&
                              homeController.userModel.value?.imgAvatar !=
                                  null) {
                            profileController.imageUrl.value =
                                homeController.userModel.value?.imgAvatar ?? '';
                          }

                          final userModel = UserModel(
                            id: homeController.userModel.value?.id ?? '',
                            email: homeController.userModel.value?.email ?? '',
                            firstName: profileController
                                .editFirstNameController.text
                                .trim(),
                            lastName: profileController
                                .editLastNameController.text
                                .trim(),
                            passWord:
                                homeController.userModel.value?.passWord ?? '',
                            imgAvatar: profileController.imageUrl.value,
                            phoneNub: profileController
                                .editPhoneNumberController.text
                                .trim(),
                            location: profileController
                                .editLocationController.text
                                .trim(),
                            isActive: true,
                          );
                          await profileController.updateUserProfile(userModel);
                        },
                        textBtn: CommonConstants.save.tr,
                        colorBgr: ColorConstants.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
