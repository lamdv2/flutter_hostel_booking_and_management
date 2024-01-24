import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../models/hostel/hostel_model.dart';
import '../../../shared/constants/app_style.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/image_constant.dart';
import '../../../shared/utils/size_utils.dart';

class buildItemHostelSub extends StatelessWidget {
  final HostelModel? hostelModel;
  buildItemHostelSub({
    required this.hostelModel,
  });

  final AppController appController = Get.find();

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
                      ? AppStyles.white000Size16Fw500FfNunito
                      : AppStyles.black000Size16Fw500FfNunito,
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
                      ? AppStyles.white000Size14Fw400FfNunito
                      : AppStyles.black000Size14Fw400FfNunito,
                ),
                SizedBox(
                  height: getSize(8),
                ),
                Text(
                  hostelModel?.phoneNub ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: appController.isDarkModeOn.value
                      ? AppStyles.white000Size14Fw400FfNunito
                      : AppStyles.black000Size14Fw400FfNunito,
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
