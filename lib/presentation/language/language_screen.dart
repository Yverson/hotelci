import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/language/language_controller.dart';

class LanguageListScreen extends StatelessWidget {
  final LanguageController _con = Get.put(LanguageController());

  LanguageListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "choosethelanguage".tr, noAction: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.height,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black : AppColors.backgroundColor),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "selectyourpreferredlanguage".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 40),
              ...LocalizationService.langs.map((String lan) {
                return Column(
                  children: [
                    tileWidget(
                      onTap: () {
                        _con.lang.value = lan;
                      },
                      title: lan,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () =>
                    {LocalizationService().changeLocale(_con.lang.value)},
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.appColor,
                  ),
                  child: Center(
                    child: Text(
                      "confirmlanguage".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.020,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileWidget({
    Function()? onTap,
    String? title,
  }) =>
      Obx(
        () => GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.transparent : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: title == _con.lang.value
                    ? AppColors.appColor
                    : const Color(0xffD4D4D4),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    color: title == _con.lang.value
                        ? AppColors.appColor
                        : Get.isDarkMode
                            ? Colors.white54
                            : Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: title == _con.lang.value
                        ? AppColors.appColor
                        : AppColors.appColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: title == _con.lang.value
                      ? const Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 10,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
}
