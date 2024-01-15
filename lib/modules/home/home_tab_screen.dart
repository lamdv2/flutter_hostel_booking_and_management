// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/models/hostel/hostel_model.dart';
import 'package:flutter_getx_base/modules/profile/image_full_screen.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';

import '../../shared/constants/colors.dart';
import 'home_tab_controller.dart';

class HomeTabScreen extends GetView<HomeTabController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(getSize(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getSize(20)),
                Text(
                  "Popular Hostel",
                  style: AppStyles.black000Size18Fw600FfMont,
                ),
                SizedBox(height: getSize(20)),
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
                            itemCount:
                                controller.listTourCurrentTabs.value?.length ??
                                    0,
                            itemBuilder: (BuildContext context, int rowIndex) {
                              return Row(
                                children: [
                                  if (rowIndex > 0)
                                    SizedBox(
                                      width: getSize(16),
                                    ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: _buildItemHistory(
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
                  style: AppStyles.black000Size18Fw600FfMont,
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
                            itemCount:
                                controller.listTourCurrentTabs.value?.length ??
                                    0,
                            itemBuilder: (BuildContext context, int rowIndex) {
                              return Row(
                                children: [
                                  if (rowIndex > 0)
                                    SizedBox(
                                      width: getSize(16),
                                    ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: _buildItemHistory(
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
                  style: AppStyles.black000Size18Fw600FfMont,
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
                            itemCount:
                                controller.listTourCurrentTabs.value?.length ??
                                    0,
                            itemBuilder: (BuildContext context, int rowIndex) {
                              return Row(
                                children: [
                                  if (rowIndex > 0)
                                    SizedBox(
                                      width: getSize(16),
                                    ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: _buildItemHistory(
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
    );
  }
}

class _buildItemHistory extends StatelessWidget {
  HostelModel? hostelModel;
  _buildItemHistory({
    required this.hostelModel,
  });

  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .76,
      padding: EdgeInsets.all(getSize(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getSize(16)),
        color: appController.isDarkModeOn.value
            ? ColorConstants.darkCard
            : ColorConstants.lightCard,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  hostelModel?.nameHostel ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: appController.isDarkModeOn.value
                      ? AppStyles.white000Size16Fw500FfMont
                      : AppStyles.black000Size16Fw500FfMont,
                ),
                SizedBox(
                  height: getSize(8),
                ),
                Text(
                  hostelModel?.address ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: appController.isDarkModeOn.value
                      ? AppStyles.white000Size14Fw400FfMont
                      : AppStyles.black000Size14Fw400FfMont,
                ),
                SizedBox(
                  height: getSize(8),
                ),
                Text(
                  hostelModel?.phoneNub ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: appController.isDarkModeOn.value
                      ? AppStyles.white000Size14Fw400FfMont
                      : AppStyles.black000Size14Fw400FfMont,
                ),
              ],
            ),
          ),
          SizedBox(
            width: getSize(16),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(getSize(14)),
            child:
                hostelModel?.imgHostel != null && hostelModel?.imgHostel != []
                    ? CachedNetworkImage(
                        height: getSize(120),
                        width: getSize(120),
                        fit: BoxFit.cover,
                        imageUrl: hostelModel?.imgHostel?.first ?? '',
                      )
                    : Image.asset(
                        height: getSize(120),
                        width: getSize(120),
                        ImageConstant.imgSplash1,
                        fit: BoxFit.cover,
                      ),
          ),
        ],
      ),
    );
  }
}
