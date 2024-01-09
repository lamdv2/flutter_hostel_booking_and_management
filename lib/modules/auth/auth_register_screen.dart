import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../../shared/constants/app_style.dart';
import '../../shared/constants/my_button.dart';
import '../../shared/constants/my_textfield.dart';
import '../../shared/constants/square_tile.dart';
import '../../shared/utils/regex.dart';
import '../../shared/utils/size_utils.dart';
import 'auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? onTap;
  RegisterScreen({super.key, this.onTap});

  final AuthController controller = Get.find();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icon
                    const SizedBox(
                      height: 12,
                    ),
                    Image.asset(
                      ImageConstant.iconApple,
                      fit: BoxFit.cover,
                      width: getSize(84),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Text(
                      "Let's create an account for you!",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Form(
                      key: registerKey,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: controller.registerEmailController,
                            hintText: "Enter your email",
                            obscureText: false,
                            validatorCheck: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email don\'t empty';
                              }
                              if (!Regex.isEmail(value.trim())) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          MyTextField(
                            controller: controller.registerPasswordController,
                            hintText: "Enter your password",
                            obscureText: true,
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
                          const SizedBox(
                            height: 16,
                          ),
                          MyTextField(
                            controller:
                                controller.registerConfirmPasswordController,
                            hintText: "Confirm your password",
                            obscureText: true,
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
                          const SizedBox(
                            height: 45,
                          ),
                          MyButton(
                            onTap: () {
                              if (registerKey.currentState!.validate()) {
                                controller.register(context);
                              }
                            },
                            textBtn: CommonConstants.signup.tr,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Text(
                            " or continue with ",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google
                        SquareTile(
                          onTap: () => AuthService().signInWithGoogle(),
                          imgPath: ImageConstant.iconGoogle,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        SquareTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Warning!!!'),
                                  content:
                                      const Text("The feature is coming soon"),
                                  actions: [
                                    TextButton(
                                      onPressed: Get.back,
                                      child: Text(
                                        CommonConstants.ok.tr,
                                        style:
                                            AppStyles.blue000Size14Fw600FfMont,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          imgPath: ImageConstant.iconApple,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CommonConstants.alreadly.tr,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
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
