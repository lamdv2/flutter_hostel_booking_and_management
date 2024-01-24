// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../../app_controller.dart';
import '../../../models/hostel/hostel_model.dart';
import '../../../shared/constants/app_style.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/image_constant.dart';
import '../../../shared/utils/size_utils.dart';

class buildItemHostelMain extends StatelessWidget {
  final HostelModel? hostelModel;
  buildItemHostelMain({
    required this.hostelModel,
  });

  final AppController appController = Get.find();
  bool isFavor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getSize(10)),
        color: appController.isDarkModeOn.value
            ? ColorConstants.darkCard
            : ColorConstants.lightCard,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(getSize(10)),
                child: hostelModel?.imgHostel != null &&
                        hostelModel?.imgHostel != []
                    ? CachedNetworkImage(
                        height: getSize(200),
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        imageUrl: hostelModel?.imgHostel?.first ?? '',
                      )
                    : Image.asset(
                        height: getSize(200),
                        width: double.maxFinite,
                        ImageConstant.imgSplash3,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                bottom: 8,
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
              Positioned(
                top: 8,
                right: 8,
                child: LikeButton(
                  onTap: (isLiked) async {
                    // if (isFavor == false) {
                    //   favoriteController.setTourFavorite(tourModel.idTour ?? "");
                    // } else {
                    //   favoriteController
                    //       .removeTourFavourite(tourModel.idTour ?? "");
                    // }
                    return Future.value(!isLiked);
                  },
                  isLiked: isFavor,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  size: 32,
                  circleColor: const CircleColor(
                    start: Color(0xff00ddff),
                    end: Color(0xff0099cc),
                  ),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      FontAwesomeIcons.solidHeart,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 22,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(getSize(16)),
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
                        '4.1 km away from you',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: appController.isDarkModeOn.value
                            ? AppStyles.botTitle000Size14Fw400FfNunito
                            : AppStyles.titleSearchSize14Fw400FfNunito,
                      ),
                      SizedBox(
                        height: getSize(4),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
