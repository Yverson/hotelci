import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/addReview/add_review_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';

class AddReviewScreen extends StatelessWidget {
  final AddReviewsController _con = Get.put(AddReviewsController());
  AddReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      appBar: appBar(text: 'addreview'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'giveyourgrades'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            StarRating(
              border: true,
              size: 30,
              onRatingChanged: (val) {},
              color: Colors.amber,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: Get.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.transparent : Colors.white,
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: AppColors.appColor,
                autocorrect: true,
                maxLines: 7,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'whatdoyousay'.tr,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'whatdoyouthink'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Row(
                children: [
                  dualContainer(
                    'recommended'.tr,
                    0,
                    () => _con.setTab(0),
                  ),
                  dualContainer(
                    'notrecommended'.tr,
                    1,
                    () => _con.setTab(1),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(text: "addreview".tr),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget dualContainer(
    String text,
    int index,
    Function() onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 11),
          height: Get.height * 0.05,
          decoration: BoxDecoration(
            color: _con.onSelect.contains(index)
                ? AppColors.appColor
                : Get.isDarkMode
                    ? Colors.transparent
                    : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _con.onSelect.contains(index)
                  ? Colors.transparent
                  : Get.isDarkMode
                      ? AppColors.borderColor
                      : Colors.white,
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: _con.onSelect.contains(index)
                    ? Colors.white
                    : AppColors.textGreyColor,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
