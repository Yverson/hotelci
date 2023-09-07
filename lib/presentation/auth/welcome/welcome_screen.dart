import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/auth/welcome/welcome_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeController _con = Get.put(WelcomeController());
  WelcomeScreen({Key? key}) : super(key: key);
  // bool _estPresenter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.loginRegisterScreen),
                      child: Row(
                        children: [
                          Text(
                            "skip".tr,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CarouselSlider(
                carouselController: _con.carouselController,
                options: CarouselOptions(
                  height: Get.height * 0.4,
                  viewportFraction: 1,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    _con.currentIndex.value = index;
                  },
                ),
                items: [
                  0,
                  1,
                  2,
                ].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          _con.welcomeList[i].image,
                        );
                      },
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: Get.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) =>
                        indicator(index, _con.currentCarouselIndex.value),
                  ),
                ),
              ),
              SizedBox(height: Get.height * .06),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    _con.welcomeList[_con.currentIndex.value].title.tr,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * .02),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    _con.welcomeList[_con.currentIndex.value].subtitle.tr,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                      color: Get.isDarkMode
                          ? Colors.white54
                          : Colors.black.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AppButton(
                  text: _con.currentIndex.value == 2 ? "start" : "next".tr,
                  height: 50,
                  image: ImageConstant.rightarrow,
                  onPressed: () {
                    /* _con.currentIndex.value == 2
                        ? Get.toNamed(AppRoutes.loginRegisterScreen)
                        : _con.carouselController.nextPage();*/
                    if (_con.currentIndex.value == 2) {
                      Statue_presentation();
                      Get.toNamed(AppRoutes.loginRegisterScreen);
                    } else {
                      _con.carouselController.nextPage();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Statue_presentation() async {
    bool pres = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("presentation", pres);
  }

  indicator(
    int index,
    int value,
  ) {
    return Obx(
      () => Container(
        height: 12,
        width: 12,
        margin: const EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
          color: index == _con.currentIndex.value
              ? AppColors.appColor
              : AppColors.appColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
