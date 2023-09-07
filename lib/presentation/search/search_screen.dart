import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/search_box.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';
import 'package:hotel_ci/presentation/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchHotelController _con = Get.put(SearchHotelController());
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.transparent : Colors.white,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchText,
                  onSubmitted: (searchInfo) async {
                    print(searchInfo);
                    var hotels = GlobalVariable.ClientsData!.listeHotel!.where((i) => i.description.toString().toLowerCase().contains(searchInfo.toLowerCase())).toList();
                    _con.SearchHotel(hotels);
                  },
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.go,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "search".tr + '...',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          ImageConstant.search,
                          height: 15,
                          width: 15,
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 15),
            commonText('discover'.tr, 'seeall'.tr, 16),
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
                        itemCount: _con.listeHotel.length,
                        itemBuilder: (context, position) {
                          Providers? postItem = _con.listeHotel![position];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.borderColor.withOpacity(.7),
                              ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.cyan,
                                    child: postItem.photo != null ? Image.network(postItem.photo.toString()) : Image.asset(ImageConstant.image),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                        postItem!.description.toString().tr,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ),
                                  const SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
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
                                ],
                              ),
                          );
                        });
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

  commonText(
    String? text,
    String? text1,
    double? fontsize,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: TextStyle(
              fontSize: fontsize!,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
