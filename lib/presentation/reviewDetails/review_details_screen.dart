import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';

class ReviewDetailsScreen extends StatelessWidget {
  const ReviewDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      appBar: appBar(text: "reviewdetail".tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'checkin'.tr,
                      style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      'Wed, 16 Jan 2020',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'checkout'.tr,
                      style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      'Sat, 16 Jan 2020',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 1,
              width: Get.width,
              color: AppColors.textGreyColor.withOpacity(0.5),
            ),
            const SizedBox(height: 15),
            const Text(
              'Jhon Doe',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                StarRating(
                  onRatingChanged: (val) {},
                  color: Colors.amber,
                  rating: 4,
                ),
                const Spacer(),
                Text(
                  '22 Des',
                  style: TextStyle(
                    color: AppColors.textGreyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Leo neque lorem et tortor. Leo donec eu, duismauris, libero, aenean nam sagittis. Convallis tinciduntornare venenatis turpis. Vel ante orci, Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 1.5,
                color: AppColors.textGreyColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:  Text(
                  'recommended'.tr,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
