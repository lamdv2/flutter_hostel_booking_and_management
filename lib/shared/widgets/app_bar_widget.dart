import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/size_utils.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.leading,
    this.titles,
    this.actions,
    this.backgroundColor,
    this.iconBgrColor,
    this.onTap,
  }) : super(key: key);

  double? height;

  Widget? leading;

  String? titles;

  Color? backgroundColor;

  Color? iconBgrColor;

  List<Widget>? actions;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? ColorConstants.lightBackground,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 8,
              bottom: 8,
            ),
            child: InkWell(
              onTap: onTap != null ? () => onTap!() : () => Get.back(),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 2,
                  top: 2,
                  bottom: 2,
                  right: 2,
                ),
                child: Container(
                  padding: EdgeInsets.all(getSize(8)),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.borderGray),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(68),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/ic_next_left.svg",
                    colorFilter: ColorFilter.mode(
                      iconBgrColor ?? ColorConstants.grey800!,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
      title: Text(
        titles ?? '',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: AppStyles.black000Size20Fw500FfMont,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? getVerticalSize(getSize(70)));
  }
}
