import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "verifyyouremail".tr,
        noAction: true,
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    authTitle("checkyourmail".tr),
                    const SizedBox(height: 10),
                    authSubtitle(
                        "wehavesentaotptoyourmailpleaseverify".tr),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: PinCodeTextField(
                              hintStyle: TextStyle(color: AppColors.appColor),
                              textStyle: TextStyle(color: AppColors.appColor),
                              appContext: context,
                              animationType: AnimationType.scale,
                              cursorColor: AppColors.appColor,
                              pinTheme: PinTheme(
                                fieldHeight: 50,
                                fieldWidth: 50,
                                activeColor: AppColors.appTextFeildColor,
                                activeFillColor: AppColors.appTextFeildColor,
                                inactiveColor: AppColors.appTextFeildColor,
                                inactiveFillColor: AppColors.appTextFeildColor,
                                disabledColor: AppColors.appTextFeildColor,
                                selectedFillColor: AppColors.appTextFeildColor,
                                selectedColor: AppColors.appTextFeildColor,
                                errorBorderColor: AppColors.appTextFeildColor,
                                borderRadius: BorderRadius.circular(10),
                                shape: PinCodeFieldShape.box,
                                fieldOuterPadding: const EdgeInsets.all(10),
                              ),
                              enableActiveFill: true,
                              length: 4,
                              onChanged: (e) {},
                            ),
                          ),
                          const SizedBox(height: 10),
                          AppButton(
                            height: 50,
                            onPressed: () {
                              Get.toNamed(AppRoutes.confirmPasswordScreen);
                            },
                            text: "send".tr,
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
