import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';
import 'package:hotel_ci/presentation/commonWidgets/text.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "createnewpassword".tr, noAction: true),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    authTitle("createnewpassword".tr),
                    const SizedBox(height: 10),
                    authSubtitle("enterthepasswordforsecureyouraccount".tr),
                    SizedBox(height: Get.height * 0.03),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Get.isDarkMode
                                ? Colors.white54
                                : Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          AppTextField(
                            color: AppColors.appTextFeildColor,
                            radius: 5,
                            hintText: "newpassword".tr,
                            obsecureText: true,
                            prefixIcon: ImageConstant.password,
                            suffixIcon: ImageConstant.eye,
                          ),
                          const SizedBox(height: 10),
                          AppTextField(
                            color: AppColors.appTextFeildColor,
                            radius: 5,
                            hintText: "conformpassword".tr,
                            obsecureText: true,
                            prefixIcon: ImageConstant.password,
                            suffixIcon: ImageConstant.eye,
                          ),
                          const SizedBox(height: 20),
                          AppButton(
                            height: 50,
                            onPressed: () {
                              // Get.toNamed(AppRoutes.otpScreen);
                            },
                            text: "save".tr,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
