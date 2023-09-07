import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/favorite/favourite_controller.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';

class FavouriteScreen extends StatelessWidget {
  final FavouriteController _con = Get.put(FavouriteController());
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: Get.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.transparent : Colors.white,
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(
                      0,
                      2,
                    ),
                    blurRadius: 1,
                    spreadRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The Great Hyatt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Image.asset(
                              ImageConstant.livelocation,
                              height: 13,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Marina bay, Singapore',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Get.isDarkMode
                                      ? Colors.white70
                                      : AppColors.textGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              '\$720',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.appColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'paymentcompleted'.tr,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'history'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
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
                    return ListView.builder(
                      itemCount: reponse.favorisHotel!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, postition) {
                        Providers postItem =
                            reponse.favorisHotel![postition];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Colors.transparent
                                : Colors.white,
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(
                                  0,
                                  2,
                                ),
                                blurRadius: 1,
                                spreadRadius: 1.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstant.image),
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
                                        Expanded(
                                          child: Text(
                                            postItem.description.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Container(
                                            height: 30,
                                            width: 30,
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: AppColors.appColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: GestureDetector(
                                                onTap: () {
                                                  _con.onSelect(postition);
                                                },
                                                child: _con.onSelectFavourite
                                                        .contains(postition)
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: Colors.white70,
                                                        size: 18,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                        size: 18,
                                                      )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          ImageConstant.livelocation,
                                          height: 13,
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            postItem.description.toString(),
                                            style: TextStyle(
                                              color: AppColors.textGreyColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Image.asset(
                                          ImageConstant.star,
                                          height: 12,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '4.8',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'bookagain'.tr,
                                              style: TextStyle(
                                                color: AppColors.textGreyColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
