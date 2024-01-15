// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/models/hostel/hostel_model.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
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
                Text(
                  "Popular Hostel",
                  style: AppStyles.black000Size18Fw500FfMont,
                ),
                SizedBox(
                  height: 500,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int rowIndex) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: getSize(12)),
                                child: _buildItemHistory(
                                  hostelModel:
                                      controller.listTourCurrentTabs.value?[0],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
      padding: EdgeInsets.all(
        getSize(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getSize(16)),
        color: appController.isDarkModeOn.value
            ? ColorConstants.darkCard
            : ColorConstants.lightCard,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  hostelModel?.nameHostel ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: appController.isDarkModeOn.value
                      ? AppStyles.white000Size16Fw500FfMont
                      : AppStyles.black000Size16Fw500FfMont,
                ),
                SizedBox(
                  height: getSize(8),
                ),
                // Text(
                //   historyModel?.bookingDate == null
                //       ? "failing"
                //       : historyTourController.timestampToString(
                //           historyModel?.bookingDate ?? Timestamp.now()),
                //   style: appController.isDarkModeOn.value
                //       ? AppStyles.white000Size14Fw400FfMont
                //       : AppStyles.black000Size14Fw400FfMont,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                // SizedBox(
                //   height: getSize(8),
                // ),
                // Text(
                //   '${historyModel?.totalPrice} VND',
                //   overflow: TextOverflow.ellipsis,
                //   textAlign: TextAlign.left,
                //   style: AppStyles.blue000Size14Fw400FfMont,
                // ),
              ],
            ),
          ),
          SizedBox(
            width: getSize(30),
          ),
          // Expanded(
          //   flex: 1,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(getSize(14)),
          //     child: tourModel?.images != null && tourModel?.images != []
          //         ? CachedNetworkImage(
          //             height: getSize(77),
          //             width: getSize(77),
          //             fit: BoxFit.cover,
          //             imageUrl: tourModel?.images?.first ?? '',
          //           )
          //         : Image.asset(
          //             height: getSize(77),
          //             width: getSize(77),
          //             AssetHelper.city_1,
          //             fit: BoxFit.cover,
          //           ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
