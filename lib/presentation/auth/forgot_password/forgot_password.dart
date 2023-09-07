import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';
import 'package:hotel_ci/presentation/commonWidgets/text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "forgotpassword".tr,
        noAction: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      authTitle("forgotpassword".tr + "?"),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: authSubtitle(
                          "entertheemailaddressassociatedwithyouraccount".tr,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.05),
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
                              hintText: "email".tr,
                              prefixIcon: ImageConstant.email2,
                            ),
                            const SizedBox(height: 20),
                            AppButton(
                              height: 50,
                              onPressed: () {
                                Get.toNamed(AppRoutes.otpVerifyScreen);
                              },
                              text: "send".tr,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(),
                  RichText(
                    text: TextSpan(
                      text: "backto".tr + ' ',
                      style: TextStyle(
                        color: Get.isDarkMode
                            ? Colors.white
                            : AppColors.textGreyColor,
                      ),
                      children: [
                        TextSpan(
                          text: "login".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.appColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
