import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/core/utils/app_color.dart';
import 'package:hotel_ci/core/utils/image_constant.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "aboutus".tr, action: ImageConstant.delete),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 40),
              Text(
                "contactinformation".tr + " :",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              aboutUs(
                  image: ImageConstant.email, info: "uitheme.world@gmail.com"),
              aboutUs(image: ImageConstant.call, info: "+91 8469393218"),
              const SizedBox(height: 20),
              Text(
                'companyaddress'.tr + " :",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              aboutUs(
                  image: ImageConstant.location1,
                  info:
                      "201, Nilkanth plaza Kiran chowk near yogi chowk varachha road, Surat, Gujarat, India 395010"),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Container aboutUs({String? info, String? image}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.transparent : Colors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                image!,
                height: 20,
                color: Get.isDarkMode ? Colors.white54 : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              info!,
              style: TextStyle(
                  color: AppColors.textGreyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
