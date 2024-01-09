import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeTabScreen extends GetView<HomeTabController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Text("OK"),
          ],
        ),
      ),
    );
  }
}
