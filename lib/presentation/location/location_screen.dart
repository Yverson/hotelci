import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/location/locations_controller.dart';

class LocationScreen extends StatelessWidget {
  final LocationsController _con = Get.put(LocationsController());
  LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _con.markers.add(
      Marker(
        markerId: const MarkerId("marker_id"),
        position: _con.latLng,
        onTap: () {
          _con.customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageConstant.locationsPin),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Grand Hyatt ",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Triangle.isosceles(
                  edge: Edge.BOTTOM,
                  child: Container(
                    color: AppColors.primaryColor,
                    width: 10.0,
                    height: 10.0,
                  ),
                ),
              ],
            ),
            _con.latLng,
          );
        },
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(text: "location".tr, backgroundColor: Colors.transparent),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _con.customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _con.customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _con.customInfoWindowController.googleMapController = controller;
            },
            markers: _con.markers,
            initialCameraPosition: CameraPosition(
              target: _con.latLng,
              zoom: _con.zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _con.customInfoWindowController,
            // height: 60,
            width: 150,
            offset: 50,
          ),
          draggableScrollableSheet(),
        ],
      ),
    );
  }

  draggableScrollableSheet() {
    return DraggableScrollableSheet(
      // initialChildSize: 0.2,
      // minChildSize: 0.12,
      // maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 2,
                width: 40,
                color: AppColors.textGreyColor,
              ),
              const SizedBox(height: 5),
              Flexible(
                child: ListView.builder(
                    itemCount: 5,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Carlton City Hotel',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            ImageConstant.fav,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstant.location2,
                                            height: 17,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '1.4km',
                                            style: TextStyle(
                                              color: AppColors.textGreyColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: '\$45',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '/Night',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textGreyColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff27AE60)
                                                  .withOpacity(.2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              '8 ' + 'roomavailable'.tr,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff27AE60),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'favoriteplaceinthearea'.tr,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
