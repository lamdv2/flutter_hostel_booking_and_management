// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/modules/home/widget/hostel_sub_item_widget.dart';
import 'package:flutter_getx_base/modules/profile/image_full_screen.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';

import '../../shared/constants/colors.dart';
import 'home_tab_controller.dart';
import 'widget/hostel_item_widget.dart';
import 'widget/hostel_main_item_widget.dart';

class HomeTabScreen extends GetView<HomeTabController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: appController.isDarkModeOn.value
                ? ColorConstants.darkBackground
                : ColorConstants.lightBackground,
            extendBody: true,
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.all(getSize(20)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimSearchBar(
                      width: MediaQuery.of(context).size.width,
                      helpText: "Enter your location",
                      textController: controller.searchHomeController,
                      onSuffixTap: () {},
                      onSubmitted: (String) {},
                    ),
                    Text(
                      "Popular Hostel",
                      style: AppStyles.black000Size20Fw600FfNunito,
                    ),
                    SizedBox(
                      height: getSize(196),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: controller.listTourCurrentTabs.value != null &&
                                controller.listTourCurrentTabs.value!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                        .listTourCurrentTabs.value?.length ??
                                    0,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return Row(
                                    children: [
                                      if (rowIndex > 0)
                                        SizedBox(
                                          width: getSize(16),
                                        ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: buildItemHostel(
                                          hostelModel: controller
                                              .listTourCurrentTabs.value?[0],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(height: getSize(24)),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: getSize(16),
                        mainAxisSpacing: getSize(16),
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(
                            FullImageScreen(
                              imageUrl:
                                  "https://firebasestorage.googleapis.com/v0/b/booking-travel-flutter.appspot.com/o/citys%2Fcau_rong_dn.png?alt=media&token=2de44eca-f216-4ea4-a5f6-d23498c36ff6",
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(getSize(8)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://firebasestorage.googleapis.com/v0/b/booking-travel-flutter.appspot.com/o/citys%2Fcau_rong_dn.png?alt=media&token=2de44eca-f216-4ea4-a5f6-d23498c36ff6",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: getSize(32)),
                    Text(
                      "New Hostel",
                      style: AppStyles.black000Size18Fw600FfNunito,
                    ),
                    SizedBox(height: getSize(16)),
                    SizedBox(
                      height: getSize(298),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: controller.listTourCurrentTabs.value != null &&
                                controller.listTourCurrentTabs.value!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                        .listTourCurrentTabs.value?.length ??
                                    0,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return Row(
                                    children: [
                                      if (rowIndex > 0)
                                        SizedBox(
                                          width: getSize(20),
                                        ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: buildItemHostelMain(
                                          hostelModel: controller
                                              .listTourCurrentTabs.value?[0],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(height: getSize(32)),
                    Text(
                      "Sale Hostel",
                      style: AppStyles.black000Size18Fw600FfNunito,
                    ),
                    SizedBox(height: getSize(16)),
                    SizedBox(
                      height: getSize(158),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: controller.listTourCurrentTabs.value != null &&
                                controller.listTourCurrentTabs.value!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                        .listTourCurrentTabs.value?.length ??
                                    0,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return Row(
                                    children: [
                                      if (rowIndex > 0)
                                        SizedBox(
                                          width: getSize(16),
                                        ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: buildItemHostelSub(
                                          hostelModel: controller
                                              .listTourCurrentTabs.value?[0],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : SizedBox.shrink(),
                      ),
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
