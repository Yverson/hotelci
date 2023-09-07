import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "discover".tr),
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(children: [
            commonText(
              'discover'.tr, /* 'seeall'.tr*/
            ),
            FutureBuilder(
                future: fetchProviders(),
                builder: (context, snapshot) {
                  if (snapshot.hasError == true) {
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var reponse = snapshot.data as ClientsDatas;
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 12,
                          childAspectRatio: .7,
                        ),
                        itemCount: reponse.listeHotelNear!.length,
                        itemBuilder: (context, position) {
                          Providers postItem =
                              reponse.listeHotelNear![position];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.borderColor.withOpacity(.7),
                              ),
                            ),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.cyan,
                                    child: postItem.photo != null ? Image.network(postItem.photo.toString()) : Image.asset(ImageConstant.image),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      postItem.description.toString().tr,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        StarRating(
                                          onRatingChanged: (val) {},
                                          color: Colors.amber,
                                          rating: 4.3,
                                        ),
                                        const Text(
                                          ' (85)',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {

                                            GlobalVariable.Nearhotel = postItem;
                                            GlobalVariable.Currenthotel = postItem;
                                            Get.toNamed(AppRoutes.homeDetailScreen);

                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 3),
                                            decoration: BoxDecoration(
                                              color: AppColors.appColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              'booknow'.tr,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ])),
    );
  }

  commonText(
    String? text,
    // String? text1,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          const Spacer(),
          /* Text(
            text1!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textGreyColor),*/
        ],
      ),
    );
  }
}
