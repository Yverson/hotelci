import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/terms&condition/terms_condition_controller.dart';

class TermsConditionScreen extends StatelessWidget {
  TermsConditionScreen({Key? key}) : super(key: key);
  final TermsConditionScreenController _con =
      Get.put(TermsConditionScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar(text: "terms&condition".tr),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _con.termsConditionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (termsConditionItem(index));
                    }),
                checkBox(
                  func: () {
                    _con.isTC.value = !_con.isTC.value;
                  },
                  name: "termsandcondition".tr,
                  icon: _con.isTC.value
                      ? const Icon(
                          Icons.done,
                          size: 12,
                        )
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                checkBox(
                  func: () {
                    _con.ispolicy.value = !_con.ispolicy.value;
                  },
                  name: "privacypolicy".tr,
                  icon: _con.ispolicy.value
                      ? const Icon(
                          Icons.done,
                          size: 12,
                        )
                      : null,
                ),
                const SizedBox(height: 40),
                AppButton(
                  color: _con.ispolicy.value && _con.isTC.value
                      ? AppColors.appColor
                      : AppColors.borderColor,
                  text: "accept".tr,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 15),
                AppButton(
                  text: "decline".tr,
                  color: Colors.white,
                  border: true,
                  textColor: AppColors.appColor,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row checkBox({Function()? func, String? name, Icon? icon}) {
    return Row(
      children: [
        SizedBox(
          width: Get.width / 4,
        ),
        GestureDetector(
          onTap: func,
          child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff7D7D7D))),
              child: icon),
        ),
        const SizedBox(width: 10),
        const Text("I agree with the",
            style: TextStyle(fontSize: 10, color: Color(0xff7D7D7D))),
        const SizedBox(width: 3),
        Text(name!,
            style: const TextStyle(
                fontSize: 10,
                color: Color(0xff7D7D7D),
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  termsConditionItem(index) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _con.termsConditionList[index]['subTitle'] != ''
                ? Text(
                    _con.termsConditionList[index]['subTitle'],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode
                          ? Colors.grey
                          : const Color(0xff02190C),
                      fontSize: 16.0,
                    ),
                  )
                : Container(),
            _con.termsConditionList[index]['subTitle'] != ''
                ? const SizedBox(
                    height: 10,
                  )
                : Container(),
            _con.termsConditionList[index]['description'] != ''
                ? Text(
                    _con.termsConditionList[index]['description'],
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? Colors.white24
                          : AppColors.textGreyColor,
                      fontSize: 12,
                      height: 1.7,
                    ),
                  )
                : Container(),
          ],
        ),
      );
}
