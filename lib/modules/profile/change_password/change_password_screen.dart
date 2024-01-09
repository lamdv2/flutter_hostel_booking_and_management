import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/my_button.dart';
import '../../../shared/constants/my_textfield.dart';
import '../../../shared/utils/regex.dart';
import '../../../shared/utils/size_utils.dart';
import '../../../shared/widgets/app_bar_widget.dart';
import '../profile_controller.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  ChangePasswordScreen({super.key});

  final AppController appController = Get.find();
  final ProfileController profileController = Get.find();
  final GlobalKey<FormState> changePassWord = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appController.isDarkModeOn.value
          ? ColorConstants.darkBackground
          : ColorConstants.lightBackground,
      appBar: CustomAppBar(
        titles: CommonConstants.changePassword.tr,
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.darkAppBar
            : ColorConstants.primaryColor,
        iconBgrColor: ColorConstants.grayTextField,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.all(getSize(20)),
            child: Obx(
              () => SingleChildScrollView(
                child: Form(
                  key: changePassWord,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getSize(24),
                      ),
                      Text(
                        CommonConstants.oldPassword.tr,
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
                        controller: controller.oldPasswordController,
                        hintText: '',
                        obscureText: controller.isOldPasswordVisible.value,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.togglePasswordVisibility(
                            controller.isOldPasswordVisible,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: getSize(16)),
                            child: SvgPicture.asset(
                              controller.isOldPasswordVisible.value
                                  ? ImageConstant.icHiddenPassword
                                  : ImageConstant.icShowPassword,
                              color: ColorConstants.gray500,
                            ),
                          ),
                        ),
                        validatorCheck: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password don\'t empty';
                          }
                          if (!Regex.isPasswordAtLeast6Characters(
                              value.trim())) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (!Regex.isPasswordUpcase(value.trim())) {
                            return 'Password must contain at least one capital letter';
                          }
                          if (!Regex.isPasswordNumber(value.trim())) {
                            return 'password must contain at least one number';
                          }
                          if (!Regex.isPasswordSpecialChar(value.trim())) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getSize(16),
                      ),
                      Text(
                        CommonConstants.newPassword.tr,
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
                        controller: controller.newPasswordController,
                        hintText: '',
                        obscureText: controller.isNewPasswordVisible.value,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.togglePasswordVisibility(
                            controller.isNewPasswordVisible,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: getSize(16)),
                            child: SvgPicture.asset(
                              controller.isNewPasswordVisible.value
                                  ? ImageConstant.icHiddenPassword
                                  : ImageConstant.icShowPassword,
                              color: ColorConstants.gray500,
                            ),
                          ),
                        ),
                        validatorCheck: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password don\'t empty';
                          }
                          if (!Regex.isPasswordAtLeast6Characters(
                              value.trim())) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (!Regex.isPasswordUpcase(value.trim())) {
                            return 'Password must contain at least one capital letter';
                          }
                          if (!Regex.isPasswordNumber(value.trim())) {
                            return 'password must contain at least one number';
                          }
                          if (!Regex.isPasswordSpecialChar(value.trim())) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getSize(16),
                      ),
                      Text(
                        CommonConstants.confirmNewPassword.tr,
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
                        controller: controller.newConfirmPasswordController,
                        hintText: '',
                        obscureText:
                            controller.isNewConfirmPasswordVisible.value,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.togglePasswordVisibility(
                            controller.isNewConfirmPasswordVisible,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: getSize(16)),
                            child: SvgPicture.asset(
                              controller.isNewConfirmPasswordVisible.value
                                  ? ImageConstant.icHiddenPassword
                                  : ImageConstant.icShowPassword,
                              color: ColorConstants.gray500,
                            ),
                          ),
                        ),
                        validatorCheck: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password don\'t empty';
                          }
                          if (!Regex.isPasswordAtLeast6Characters(
                              value.trim())) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (!Regex.isPasswordUpcase(value.trim())) {
                            return 'Password must contain at least one capital letter';
                          }
                          if (!Regex.isPasswordNumber(value.trim())) {
                            return 'password must contain at least one number';
                          }
                          if (!Regex.isPasswordSpecialChar(value.trim())) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getSize(48),
                      ),
                      Center(
                        child: MyButton(
                          onTap: () async {
                            if (changePassWord.currentState!.validate()) {
                              controller.isChangePassword(
                                controller.oldPasswordController.text,
                                controller.newPasswordController.text,
                                controller.newConfirmPasswordController.text,
                              );
                            }
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
      ),
    );
  }
}
