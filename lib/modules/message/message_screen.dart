import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_utils.dart';
import '../profile/image_full_screen_all.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appController.isDarkModeOn.value
          ? ColorConstants.darkBackground
          : ColorConstants.lightBackground,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(getSize(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Message"),
            ],
          ),
        ),
      ),
    );
  }
}
