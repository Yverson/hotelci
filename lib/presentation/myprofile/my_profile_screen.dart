import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';

import 'package:hotel_ci/presentation/myprofile/my_profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);
  final MyProfileController _con = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 3.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.4),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: AppColors.appColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: CircleAvatar(
                        radius: 57,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(ImageConstant.image),
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariable.CurrentUser!.UserName.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        height: 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              scrollDirection: Axis.vertical,
              itemCount: _con.profileList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _con.isSelect.value = index;

                    _con.isSelect.value == 0
                        ? Get.toNamed(AppRoutes.editProfileScreen)
                        : _con.isSelect.value == 1
                            ? Get.toNamed(AppRoutes.aboutusScreen)
                            : _con.isSelect.value == 2
                                ? Get.toNamed(AppRoutes.historyScreen)
                                : Get.toNamed(AppRoutes.editProfileScreen);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    // height: 60,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.transparent : Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          _con.profileList[index].image!,
                          color: Get.isDarkMode ? Colors.white54 : Colors.black,
                          height: 20,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          _con.profileList[index].title!,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color:
                              Get.isDarkMode ? Colors.white54 : Colors.black54,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
