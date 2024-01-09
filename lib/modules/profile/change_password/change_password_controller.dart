import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newConfirmPasswordController = TextEditingController();
  RxBool isOldPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isNewConfirmPasswordVisible = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void togglePasswordVisibility(RxBool isVisible) {
    isVisible.value = !isVisible.value;
  }

  void isChangePassword(
      String oldPass, String newPass, String newConfirm) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (newPass != newConfirm) {
        Get.snackbar(
          CommonConstants.error.tr,
          "New password and confirm password do not match",
        );
        return;
      }

      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPass,
        );

        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(newPass);
        Get.back();

        await _firestore
            .collection('userModel')
            .where('email', isEqualTo: _auth.currentUser!.email)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            _firestore
                .collection('userModel')
                .doc(querySnapshot.docs.first.id)
                .update({
              'passWord': newPass,
            }).then((value) {
              Get.snackbar(
                CommonConstants.success.tr,
                CommonConstants.passwordChangedSuccessfully.tr,
              );
            }).catchError((error) {
              Get.snackbar(
                CommonConstants.error.tr,
                "${CommonConstants.errorUpdatingPassword.tr}: $error",
              );
            });
          } else {
            Get.snackbar(
              CommonConstants.error.tr,
              CommonConstants.documentDoesNotExist.tr,
            );
          }
        }).catchError((error) {
          Get.snackbar(
            CommonConstants.error.tr,
            "${CommonConstants.errorGettingDocument.tr}: $error",
          );
        });
      } else {
        Get.snackbar(CommonConstants.error.tr, CommonConstants.error.tr);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(CommonConstants.error.tr, e.message!);
    } catch (e) {
      Get.snackbar(
        CommonConstants.error.tr,
        CommonConstants.anUnexpectedErrorOccurred.tr,
      );
    }
  }
}
