import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../models/user/user_model.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/common.dart';
import '../../shared/constants/local_storage.dart';
import '../../shared/utils/focus.dart';
import '../auth/user_controller.dart';
import '../main/home_controller.dart';
import 'edit_profile.dart';
import 'image_full_screen.dart';

class ProfileController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final editEmailController = TextEditingController();
  final editFirstNameController = TextEditingController();
  final editLastNameController = TextEditingController();
  final editPassWordController = TextEditingController();
  final editImageAvatarController = TextEditingController();
  final editPhoneNumberController = TextEditingController();
  final editLocationController = TextEditingController();
  final feedbackController = TextEditingController();

  final UserController userController = Get.find();
  final HomeController homeController = Get.find();

  final scaffoldProfileKey = GlobalKey<ScaffoldState>();

  RxString imageUpload = ''.obs;
  RxString urlImageOld = ''.obs;
  RxString imageUrl = ''.obs;

  Rx<List<AssetEntity>> imageFonts = Rx([]);
  final userModelImg = Rxn<List<String>>();

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      homeController.getUserDetails(userController.userEmail.value),
    ]);
    getThumbnails();
  }

  void getThumbnails() async {
    List<String> thumbnails = [];
    var myVideos = await _firestore
        .collection('videos')
        .where('uid', isEqualTo: homeController.userModel.value?.id ?? "")
        .get();

    for (int i = 0; i < myVideos.docs.length; i++) {
      thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
    }
    userModelImg.value = thumbnails;
  }

  void getDeleteImage(String nameImage) async {
    if (nameImage.isNotEmpty) {
      try {
        final desertRef = FirebaseStorage.instance.ref().child(nameImage);
        await desertRef.delete();
        urlImageOld.value = '';
      } catch (e) {
        return;
      }
    }
  }

  Future<void> pickImages(BuildContext context) async {
    final resultList = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: 1,
        selectedAssets: imageFonts.value,
        requestType: RequestType.image,
      ),
    );
    if (resultList != null && resultList.isNotEmpty) {
      imageFonts.value = resultList;
    }
  }

  Future<void> pickImagess(BuildContext context) async {
    var status = await Permission.photos.status;

    if (status.isGranted) {
      final resultList = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: 1,
          selectedAssets: imageFonts.value,
          requestType: RequestType.image,
        ),
      );
      if (resultList != null && resultList.isNotEmpty) {
        imageFonts.value = resultList;
      }
    } else {
      final status = await Permission.photos.request();
      if (status.isGranted) {
        final resultList = await AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(
            maxAssets: 1,
            selectedAssets: imageFonts.value,
            requestType: RequestType.image,
          ),
        );
        if (resultList != null && resultList.isNotEmpty) {
          imageFonts.value = resultList;
        }
      } else {
        Get.snackbar(
          "${CommonConstants.warning.tr}!!!",
          CommonConstants.permissionDenied.tr,
        );
        showAdaptiveDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("Permission Denied"),
            content: const Text(
                "To pick images, allow access to gallery and photos in app settings."),
            actions: [
              CupertinoDialogAction(
                child: Text(CommonConstants.cancel.tr),
                onPressed: () => Get.back(),
              ),
              CupertinoDialogAction(
                child: Text(CommonConstants.settingSystem.tr),
                onPressed: () async {
                  await openAppSettings();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    var uuid = const Uuid();

    Reference ref = _storage.ref().child(childName).child(uuid.v4());
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = ref.putData(file, metadata);
    await uploadTask;

    return getImageStorage(ref.fullPath);
  }

  Future<String> getImageStorage(String nameImage) async {
    Reference ref = FirebaseStorage.instance.ref().child(nameImage);
    try {
      final result = await ref.getMetadata();

      // ignore: unnecessary_null_comparison
      if (result != null) {
        String downloadUrl = await ref.getDownloadURL();
        return downloadUrl;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<Uint8List> assetEntityToUint8List(AssetEntity assetEntity) async {
    final file = await assetEntity.originFile;
    if (file != null) {
      List<int> bytes = await file.readAsBytes();
      return Uint8List.fromList(bytes);
    }
    throw Exception('Failed to read asset data');
  }

  Future<void> updateUserProfile(UserModel userModel) async {
    await _firestore
        .collection('userModel')
        .doc(userModel.id)
        .update(userModel.toJson())
        .then((value) {
      Get.back();
      Get.snackbar("${CommonConstants.success.tr}!",
          CommonConstants.editProfileSuccessfully.tr,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black87);
      Future.wait([
        homeController
            .getUserDetails(homeController.userModel.value?.email ?? '')
      ]);
    }).catchError((onError) {
      Get.snackbar("${CommonConstants.error.tr}!!!",
          '${CommonConstants.editProfileError.tr}: ${onError.toString()}',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black87);
    });
  }

  void createUser(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('userModel')
        .add(userModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            CommonConstants.success.tr,
            "${CommonConstants.yourAccount.tr}!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorConstants.blue.withOpacity(.1),
            colorText: ColorConstants.blue,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      Get.snackbar(
        CommonConstants.error.tr,
        "Something went wrong. Try again!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConstants.red.withOpacity(.1),
        colorText: ColorConstants.red,
      );
    });
  }

  void createPushNotification(String idUser, String fcmToken) async {
    await FirebaseFirestore.instance
        .collection('pushNotification')
        .add({
          'idUser': idUser,
          'fcmToken': fcmToken,
        })
        .whenComplete(
          () => Get.snackbar(
            CommonConstants.success.tr,
            "${CommonConstants.saveSuccess.tr}!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorConstants.blue.withOpacity(.1),
            colorText: ColorConstants.blue,
          ),
        )
        .catchError(
          // ignore: body_might_complete_normally_catch_error
          (error) {
            Get.snackbar(
              CommonConstants.error.tr,
              "Something went wrong. Try again!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: ColorConstants.red.withOpacity(.1),
              colorText: ColorConstants.red,
            );
          },
        );
  }

  void deletePushNotification(String fcmToken) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('pushNotification')
          .where('fcmToken', isEqualTo: fcmToken)
          .get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      // ignore: empty_catches
    } catch (error) {}
  }

  Future<bool> isCheckExist(String email) async {
    final snapShot = await FirebaseFirestore.instance
        .collection('userModel')
        .where('email', isEqualTo: email)
        .get();
    if (snapShot.docs.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<void> confirmLogoutDialog(
      BuildContext context, String title, Function() function) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(CommonConstants.doLogout.tr),
          actions: [
            TextButton(
              onPressed: Get.back,
              child: Text(
                CommonConstants.cancel.tr,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: function,
              child: Text(
                CommonConstants.ok.tr,
              ),
            ),
          ],
        );
      },
    );
  }

  void openDrawer() {
    scaffoldProfileKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldProfileKey.currentState?.closeDrawer();
  }

  void signUserOut(BuildContext context) async {
    AppFocus.unfocus(context);
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    confirmLogoutDialog(
      context,
      CommonConstants.logout.tr,
      () async {
        Get.back();

        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            Timer(const Duration(seconds: 1), () {
              Get.back();
            });
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        try {
          await auth.signOut();
          await googleSignIn.signOut();

          deletePushNotification(LocalStorageHelper.getValue('fcmToken') ?? "");

          userController.userName.value = '';
          userController.userEmail.value = '';
          homeController.userModel.value = null;
          profileController.imageFonts.value = [];

          clearEditController();
          LocalStorageHelper.clearListHistoryCurrentTour();

          Get.offNamed(Routes.AUTH);
        } catch (e) {
          wrongMessage("Logout failed: $e");
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  void Incorrect(String text) {
    final context = Get.context;
    showDialog(
      context: context!,
      anchorPoint: const Offset(10, 10),
      builder: (context) {
        return Center(
          child: AlertDialog(
            title: Center(child: Text(text)),
          ),
        );
      },
    );
  }

  void getEditProfile() {
    if (homeController.userModel.value != null) {
      editEmailController.text = homeController.userModel.value?.email ?? '';
      editFirstNameController.text =
          homeController.userModel.value?.firstName ?? '';
      editLastNameController.text =
          homeController.userModel.value?.lastName ?? '';
      editPassWordController.text =
          homeController.userModel.value?.passWord ?? '';
      editImageAvatarController.text =
          homeController.userModel.value?.imgAvatar ?? '';
      editPhoneNumberController.text =
          homeController.userModel.value?.phoneNub ?? '';
      editLocationController.text =
          homeController.userModel.value?.location ?? '';
    }
  }

  void clearEditController() {
    editEmailController.clear();
    editFirstNameController.clear();
    editLastNameController.clear();
    editPassWordController.clear();
    editImageAvatarController.clear();
    editPhoneNumberController.clear();
    editLocationController.clear();
  }

  void showFullImageDialog(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullImageScreen(
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  Future<void> wrongMessage(String message) async {
    await Future.delayed(const Duration(seconds: 2));

    await Future.microtask(
      () {
        final context = Get.context;
        showDialog(
          context: context!,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blue,
              title: Text(
                message,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
    );
  }
}
