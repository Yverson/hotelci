import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      appBar: appBar(
        text: "reviews".tr,
        action: ImageConstant.add,
        onPressed: () {
          Get.toNamed(AppRoutes.addReviewScreen);
        },
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.reviewDetailsScreen);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.transparent : Colors.white,
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        ImageConstant.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Thomas Henderson',
                                style: TextStyle(
                                    // fontSize: 15,
                                    ),
                              ),
                            ),
                            Text(
                              '22 Dec',
                              style: TextStyle(
                                color: AppColors.textGreyColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        StarRating(
                          onRatingChanged: (val) {},
                          color: Colors.amber,
                          rating: 4,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Leo neque lorem et tortor.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              'Recommended',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      // const SizedBox(height: 10),
    );
  }
}
