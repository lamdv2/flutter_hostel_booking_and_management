import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_utils.dart';
import '../profile/image_full_screen_all.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: getSize(16),
                  mainAxisSpacing: getSize(16),
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                      FullImageScreenAll(
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/booking-travel-flutter.appspot.com/o/citys%2Fcau_rong_dn.png?alt=media&token=2de44eca-f216-4ea4-a5f6-d23498c36ff6",
                        isCheckNetwork: true,
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
            ],
          ),
        ),
      ),
    );
  }
}
