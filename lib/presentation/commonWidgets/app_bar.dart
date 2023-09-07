import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';

AppBar appBar({
  Function()? onPressed,
  Function()? onTap,
  String? text,
  String leading = "",
  String? action,
  bool noAction = false,
  final Color? backgroundColor,
  final Color? iconColor,
  final Color? textColor,
}) =>
    AppBar(
      elevation: 0,
      backgroundColor: Get.isDarkMode
          ? Colors.black
          : backgroundColor ?? AppColors.backgroundColor,
      // key: _scaffoldKey,
      leading: leading == "menu"
          ? IconButton(
              onPressed: onTap,
              icon: Image.asset(
                ImageConstant.menu,
                color: Get.isDarkMode ? Colors.white54 : iconColor,
                height: 20,
              ),
            )
          : leading == "back"
              ? Container()
              : IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Get.isDarkMode
                        ? Colors.white54
                        : iconColor ?? AppColors.primaryColor,
                  ),
                ),
      title: Text(text!),
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Get.isDarkMode ? Colors.white54 : textColor ?? Colors.black,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        noAction
            ? Container()
            : IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  action ?? ImageConstant.notification,
                  height: 20,
                  color: Get.isDarkMode
                      ? Colors.white54
                      : iconColor ?? Colors.black,
                ),
              )
      ],
    );
