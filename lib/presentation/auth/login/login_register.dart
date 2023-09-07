import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/api.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/auth/login/login_register_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';
import 'package:hotel_ci/presentation/commonWidgets/text.dart';

class LoginRegisterScreen extends StatelessWidget {
  final LoginRegisterController _con = Get.put(LoginRegisterController());
  LoginRegisterScreen({Key? key}) : super(key: key);
  String? userName;
  String? email;
  String? password;
  String? telephone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : const Color(0xffF9F9F9),
      body: LayoutBuilder(builder: (context, constraint) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: (constraint.maxHeight -
                      MediaQuery.of(context).viewPadding.top -
                      MediaQuery.of(context).viewPadding.bottom)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      authTitle("welcome".tr),
                      const SizedBox(height: 10),
                      authSubtitle("haveaaccountsignin".tr),
                      SizedBox(height: Get.height * 0.05),
                      Container(
                        height: Get.height * 0.68,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            TabBar(
                              unselectedLabelColor: const Color(0xff9196B2),
                              labelColor: const Color(0xff444C6C),
                              labelStyle: const TextStyle(fontSize: 16),
                              indicatorColor: AppColors.appColor,
                              indicatorWeight: 4,
                              indicatorPadding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              tabs: [
                                Tab(text: "login".tr),
                                Tab(text: "signup".tr),
                              ],
                              controller: _con.tabController.value,
                            ),
                            Container(
                              height: 2,
                              color: const Color(0xff9196B2).withOpacity(0.1),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _con.tabController.value,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        AppTextField(
                                          onChange: (txt) {
                                            telephone = txt.toString();
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "Numero telephone".tr,
                                          prefixIcon: ImageConstant.call2,
                                        ),
                                        const SizedBox(height: 10),
                                        /*  AppTextField(
                                          onChange: (txt) {
                                            password = txt;
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "password".tr,
                                          obsecureText: true,
                                          prefixIcon: ImageConstant.password,
                                          suffixIcon: ImageConstant.eye,
                                        ),
                                        const SizedBox(height: 10),*/
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(AppRoutes
                                                  .forgotPasswordScreen);
                                            },
                                            child: Text(
                                              "forgotpassword".tr + "?",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff38BC8B),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        const SizedBox(height: 30),
                                        const SizedBox(height: 30),
                                        AppButton(
                                          text: "login".tr,
                                          height: 50,
                                          onPressed: () {
                                            PostRegister post = PostRegister(
                                              userName: telephone,

                                              //  password: ""
                                            );

                                            LoginUser(post).then((reponse) {
                                              if (reponse.statusCode == 200) {
                                                Navigator.pop(context);
                                                Get.toNamed(
                                                    AppRoutes.bottomBarScreen);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        AppTextField(
                                          onChange: (txt) {
                                            userName = txt.toString();
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "Nom d'utilisateur".tr,
                                          prefixIcon: ImageConstant.user,
                                        ),
                                        const SizedBox(height: 10),
                                        /* AppTextField(
                                          onChange: (txt) {
                                            email = txt;
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "email".tr,
                                          prefixIcon: ImageConstant.email2,
                                        ),
                                        const SizedBox(height: 10),*/
                                        /*  AppTextField(
                                          onChange: (txt) {
                                            password = txt.toString();
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "password".tr,
                                          obsecureText: true,
                                          prefixIcon: ImageConstant.password,
                                          suffixIcon: ImageConstant.eye,
                                        ),
                                        const SizedBox(height: 10),*/
                                        AppTextField(
                                          onChange: (txt) {
                                            telephone = txt.toString();
                                          },
                                          radius: 5,
                                          color: AppColors.appTextFeildColor,
                                          hintText: "mobilenumber".tr,
                                          obsecureText: false,
                                          prefixIcon: ImageConstant.call2,
                                        ),
                                        const Spacer(),
                                        AppButton(
                                          text: "signup".tr,
                                          height: 50,
                                          onPressed: () {
                                            PostRegister post = PostRegister(
                                                userName: telephone,
                                                tel: userName);
                                            createPost(post).then(
                                              (reponse) {
                                                if (reponse.statusCode == 200) {
                                                  //  GlobalVariable.token=reponse.;
                                                  GlobalVariable.userName =
                                                      userName.toString();
                                                  Navigator.pop(context);
                                                  Get.toNamed(AppRoutes
                                                      .bottomBarScreen);
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: _con.selectedIndex.value == 0
                            ? "alreadyhaveanaccountlogin".tr
                            : "donthaveanaccountregister".tr,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? Colors.white
                              : AppColors.textGreyColor,
                        ),
                        children: [
                          TextSpan(
                            text: _con.selectedIndex.value == 0
                                ? "register".tr
                                : "login".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.appColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (_con.selectedIndex.value == 0) {
                                  _con.tabController.value!.animateTo(1);
                                } else {
                                  _con.tabController.value!.animateTo(0);
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget socialButton({
    Function? onTap,
    required String img,
  }) =>
      GestureDetector(
        onTap: () => onTap!,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffEBF0F3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffD4D4D4),
            ),
          ),
          child: Image.asset(
            img,
            height: 20,
            width: 20,
          ),
        ),
      );
}
