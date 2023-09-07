import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: AppColors.appColor,
            ),
          )
        ],
        backgroundColor: const Color(0xffFFD7C2),
      ),
      backgroundColor: const Color(0xffFFD7C2),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  ImageConstant.congratulations,
                  height: Get.height / 3.5,
                )),
                const SizedBox(height: 20),
                Text(
                  "yourcardhasbeenaddedsuccessfully".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      fontSize: 18,
                      color: AppColors.appColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
