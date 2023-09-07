import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';

Widget searchBox({TextEditingController? controller}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Get.isDarkMode ? Colors.transparent : Colors.white,
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      onSubmitted: (searchInfo) async {
        print(searchInfo);
      },
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.go,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
          hintText: "search".tr + '...',
          hintStyle: const TextStyle(
            fontSize: 15.0,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              ImageConstant.search,
              height: 15,
              width: 15,
            ),
          ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none),
    ),
  );
}
