import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/switch.dart';
import 'package:hotel_ci/presentation/logout/app_dialog.dart';
import 'package:hotel_ci/presentation/setting/setting_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  final SettingController _con = Get.put(SettingController());

  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(text: "settings".tr),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingTitleList('basic'.tr),
                settingList(
                  icon: ImageConstant.account,
                  text: "account".tr,
                  func: () {
                    Get.toNamed(AppRoutes.myProfileScreen);
                  },
                ),
                settingList(
                  icon: ImageConstant.notification1,
                  text: "notification".tr,
                  func: () {
                    Get.toNamed(AppRoutes.notificationsScreen);
                  },
                  isSwitch: true,
                ),
                settingList(
                  icon: ImageConstant.security,
                  text: "privacy&security".tr,
                  func: () {
                    // Get.toNamed(AppRoutes.createNewPassword);
                  },
                ),
                settingList(
                  icon: ImageConstant.location,
                  text: "location".tr,
                  func: () {
                    Get.toNamed(AppRoutes.locationScreen);
                  },
                  isSwitch: true,
                ),
                settingList(
                  icon: ImageConstant.dark,
                  text: "darkmode".tr,
                  func: () {},
                  isSwitch: true,
                ),

                settingTitleList('more'),
                settingList(
                  icon: ImageConstant.laugauge,
                  text: "language".tr,
                  func: () {
                    Get.toNamed(AppRoutes.languageListScreen);
                  },
                ),
                settingList(
                  icon: ImageConstant.tc,
                  text: "terms&condition".tr,
                  func: () {
                    Get.toNamed(AppRoutes.termsConditionScreen);
                  },
                ),

                settingList(
                  icon: ImageConstant.service,
                  text: "customerservice".tr,
                  func: () {
                    // Get.toNamed(AppRoutes.customerServiceScreen);
                  },
                ),

                settingList(
                  icon: ImageConstant.signout,
                  text: "signout".tr,
                  func: () {
                    logoutDialog(
                      color: AppColors.appColor,
                      context: Get.context,
                      onTap: () {
                        Get.offAllNamed(AppRoutes.loginRegisterScreen);
                      },
                      description: "areyousureyouwanttologout".tr,
                      title: 'logout'.tr,
                    );
                  },
                ),

                // settingList(
                //     text: "Privacy Policy".tr,
                //     func: () {
                //       Get.to(PrivacyPolicyScreen());
                //     }),
                // Divider(),
                // settingList(
                //     text: "support".tr,
                //     func: () {
                //       emailLaunch('uitheme.world@gmail.com', Get.context);
                //     }),
                // Divider(),
                // settingList(
                //   text: "appShare".tr,
                //   func: () {
                //     Share.share(
                //         'Ecommerce\nhttps://education.net/user/UiThemeworld');
                //   },
                // ),
              ],
            ),
          ),
        ));
  }

  Widget settingList(
      {String? text, String? icon, Function()? func, bool? isSwitch = false}) {
    return GestureDetector(
      onTap: func,
      child: Container(
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
          children: [
            Image.asset(
              icon!,
              height: 20,
              color: Get.isDarkMode ? Colors.white54 : Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            isSwitch == false
                ? const SizedBox(
                    height: 25,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  )
                : Obx(
                    () => FlutterSwitch(
                      height: 25,
                      width: 50,
                      padding: 2,
                      value: _con.isDark.value,
                      toggleColor: AppColors.appColor,
                      activeToggleColor: Colors.white,
                      activeColor: AppColors.appColor,
                      inactiveColor: AppColors.appColor.withOpacity(.2),
                      onToggle: (val) {
                        _con.isDark.value = val;
                        if (val == true) {
                          Get.changeThemeMode(ThemeMode.dark);
                        } else {
                          Get.changeThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget settingTitleList(text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      width: Get.width,
      child: Text(
        text!,
        style: const TextStyle(
          color: Color(0xff02190C),
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  void emailLaunch(email, msg) async {
    try {
      final Uri _emailLaunchUri = Uri(
          scheme: 'mailto',
          path: '$email',
          queryParameters: {'subject': '$msg'});
      if (await canLaunch(_emailLaunchUri.toString())) {
        await launch(_emailLaunchUri.toString());
      } else {
        throw 'Could not launch ${_emailLaunchUri.toString()}';
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
