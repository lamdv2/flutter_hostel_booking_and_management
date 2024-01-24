import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../models/hostel/hostel_model.dart';
import '../../../shared/constants/app_style.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/image_constant.dart';
import '../../../shared/utils/size_utils.dart';

class buildItemHostel extends StatelessWidget {
  final HostelModel? hostelModel;
  buildItemHostel({
    required this.hostelModel,
  });

  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getSize(16)),
        color: appController.isDarkModeOn.value
            ? ColorConstants.darkCard
            : ColorConstants.lightCard,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(getSize(14)),
            child:
                hostelModel?.imgHostel != null && hostelModel?.imgHostel != []
                    ? CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: hostelModel?.imgHostel?.first ?? '',
                      )
                    : Image.asset(
                        width: double.infinity,
                        ImageConstant.imgSplash2,
                        fit: BoxFit.cover,
                      ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  hostelModel?.nameHostel ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: AppStyles.white000Size16Fw500FfNunito,
                ),
                SizedBox(
                  height: getSize(4),
                ),
                Text(
                  hostelModel?.address ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyles.white000Size14Fw400FfNunito,
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: getPadding(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getSize(10)),
                gradient: Gradients.defaultGradientBackground,
              ),
              child: Row(
                children: [
                  Text(
                    "4.5",
                    style: AppStyles.white000Size14Fw600FfNunito,
                  ),
                  SizedBox(
                    width: getSize(2),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: ColorConstants.yellowRewardColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
