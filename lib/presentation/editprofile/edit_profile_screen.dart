import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/api.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';
import 'package:hotel_ci/presentation/editprofile/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController _con = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "myprofile".tr,
        backgroundColor: AppColors.appColor,
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Container(
              width: Get.width,
              height: Get.height / 4,
              decoration: BoxDecoration(
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
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Obx(
                          () => _con.profileImage.value.path.isEmpty
                              ? _con.profileUrl.value != ""
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 57,
                                      child: CircleAvatar(
                                          radius: 55,
                                          backgroundImage: NetworkImage(
                                              _con.profileUrl.value)),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 57,
                                      child: CircleAvatar(
                                        radius: 55,
                                        backgroundImage:
                                            AssetImage(ImageConstant.image),
                                      ),
                                    )
                              : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 57,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundImage:
                                        FileImage(_con.profileImage.value),
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: 55 - 14,
                          child: GestureDetector(
                            onTap: () => _con.pickProfileFile(context),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(ImageConstant.camera),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "basicdetail".tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => AppTextField(
                    controller: _con.nameTE,
                    initialValue: _con.name.value,
                      border: true,
                      hintText: "name".tr,
                      prefixIcon: ImageConstant.profile,
                      errorMessage: _con.nameError,
                      color: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => AppTextField(
                      controller: _con.emailTE,
                      initialValue: _con.email.value,
                      border: true,
                      hintText: "email".tr,
                      prefixIcon: ImageConstant.email1,
                      errorMessage: _con.emailError,
                      color: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => AppTextField(
                      controller: _con.phoneNoTE,
                      initialValue: _con.phoneNo.value,
                      border: true,
                      color: Colors.transparent,
                      hintText: "phonenumber".tr,
                      prefixIcon: ImageConstant.call1,
                      errorMessage: _con.phoneNoError,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: AppButton(
                      text: "save".tr,
                      color: AppColors.appColor,
                      onPressed: () async {

                        if(_con.IsEnable.value == true)
                        {
                          _con.IsEnable.value = false;

                          GlobalVariable.CurrentUser!.Noms = _con.nameTE.text;
                          GlobalVariable.CurrentUser!.Email = _con.emailTE.text;
                          GlobalVariable.CurrentUser!.Contact1 = _con.phoneNoTE.text;

                          GlobalVariable.CurrentUser = await createUser();
                          Get.toNamed(AppRoutes.bottomBarScreen);

                          _con.IsEnable.value = true;
                        }

                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget gender({String? image, String? text}) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.transparent : Colors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(
                image!,
                height: 20,
              ),
            ),
            Text(text!)
          ],
        ));
  }
}
