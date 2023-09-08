import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';
import 'package:hotel_ci/presentation/nearYou/map_controller.dart';

import 'package:http/http.dart' as http;

class NearYouMapScreen extends StatefulWidget {
  NearYouMapScreen({Key? key}) : super(key: key);
  List<Marker> HotelNear = [];
  @override
  _NearYouMapScreen createState() => _NearYouMapScreen();
}

class _NearYouMapScreen extends State<NearYouMapScreen> {
  final NearYouMapMapController _con = Get.put(NearYouMapMapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(text: "Near you", backgroundColor: Colors.transparent),
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
              target: /*_con.latLng*/ LatLng(
                  double.parse(GlobalVariable.Latitude.toString()),
                  double.parse(GlobalVariable.longitude.toString())),
              zoom: /*_con.zoom*/ 15.0,
            ),
          ),
          CustomInfoWindow(
            controller: _con.customInfoWindowController,
             //height: 80,
            width: 200,
            offset: 50,
          ),
          draggableScrollableSheet(),
        ],
      ),
    );
  }

  draggableScrollableSheet() {
    FutureBuilder(
        future: fetchProviderss(),
        builder: (context, snapshot) {
          if (snapshot.hasError == true) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var reponse = snapshot.data as ClientsDatas;

            return DraggableScrollableSheet(
              initialChildSize: 0.25,
              // minChildSize: 0.2,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                            itemCount: reponse.listeHotelNear!.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            physics: const ClampingScrollPhysics(),
                            controller: scrollController,
                            itemBuilder: (context, position) {
                              Providers postItem =
                                  reponse.listeHotelNear![position];
                              return GestureDetector(
                                onTap: () {
                                  // GlobalVariable.discoverseHotel = postItem;
                                  GlobalVariable.Currenthotel = postItem;
                                  Get.toNamed(AppRoutes.chooseRoomScreen);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    ImageConstant.image),
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
                                                    Expanded(
                                                      child: Text(
                                                        postItem.description
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      ImageConstant.fav,
                                                      color: Colors.black,
                                                      height: 16,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      ImageConstant.location2,
                                                      height: 15,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '1.4km',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .textGreyColor,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: '/Night',
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .textGreyColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 30,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                                0xff27AE60)
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Text(
                                                        '8 ' +
                                                            'roomavailable'.tr,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff27AE60),
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
                                      // const SizedBox(height: 5),
                                      // const Text(
                                      //   'Favorite place in the area',
                                      //   style: TextStyle(
                                      //     color: Colors.red,
                                      //   ),
                                      // ),
                                    ],
                                  ),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    return Center( child : FutureBuilder(
        future: fetchProviderss(),
        builder: (context, snapshot) {
          if (snapshot.hasError == true) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var reponse = snapshot.data as ClientsDatas;

            return DraggableScrollableSheet(
              initialChildSize: 0.25,
              // minChildSize: 0.2,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                            itemCount: reponse.listeHotelNear!.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            physics: const ClampingScrollPhysics(),
                            controller: scrollController,
                            itemBuilder: (context, position) {
                              Providers postItem =
                              reponse.listeHotelNear![position];
                              return GestureDetector(
                                onTap: () {
                                  // GlobalVariable.discoverseHotel = postItem;
                                  GlobalVariable.discoverseHotel = postItem;
                                  GlobalVariable.Currenthotel = postItem;
                                  Get.toNamed(AppRoutes.homeDetailScreen);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15),
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: postItem.photo != null ? NetworkImage(postItem.photo.toString()) : AssetImage(ImageConstant.image) as ImageProvider ,
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
                                                    Expanded(
                                                      child: Text(
                                                        postItem.description
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    /*Image.asset(
                                                      ImageConstant.fav,
                                                      color: Colors.black,
                                                      height: 16,
                                                    ),*/
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      ImageConstant.location2,
                                                      height: 15,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      postItem.adresse.toString(),
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .textGreyColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                /*Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: '\$45',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: '/Night',
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .textGreyColor,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 30,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff27AE60)
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(5),
                                                      ),
                                                      child: Text(
                                                        '8 ' +
                                                            'roomavailable'.tr,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                          Color(0xff27AE60),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(height: 5),
                                      // const Text(
                                      //   'Favorite place in the area',
                                      //   style: TextStyle(
                                      //     color: Colors.red,
                                      //   ),
                                      // ),
                                    ],
                                  ),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  Future<ClientsDatas> fetchProviderss() async {
    if (GlobalVariable.ClientsData == null) {
      final Map<String, String> header = {
        'content-type': '	application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + GlobalVariable.token,
      };

      final response = await http.post(Uri.parse(baseUrl + '/GetClientsData'),
          body: clientsDataToJson(post), headers: header);

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var responseData = json.decode(response.body);

        ClientsDatas? cliData = ClientsDatas.fromJson(responseData);
        GlobalVariable.ClientsData = cliData;

        for (var item in GlobalVariable.ClientsData!.listeHotelNear!) {

          item.lat != null ?
          _con.markers.add(
            Marker(
              markerId: MarkerId(item.id.toString()),
              position: LatLng(double.parse(item.lat.toString()),
                  double.parse(item.longe.toString())),
              onTap: () {
                _con.customInfoWindowController.addInfoWindow!(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*Image.asset(ImageConstant.locationsPin),
                              const SizedBox(
                                width: 8.0,
                              ),*/
                              Expanded(
                                child: Text(
                                  item.description.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                              )
                            ],
                          ),
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Triangle.isosceles(
                        edge: Edge.BOTTOM,
                        child: Container(
                          color: Colors.blue,
                          width: 20.0,
                          height: 10.0,
                        ),
                      ),
                    ],
                  ),
                  LatLng(double.parse(item.lat.toString()),
                      double.parse(item.longe.toString())),
                );
              },
            ),
          )  : "";
        }

        return cliData;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        //throw Exception('Failed to load album');
        return ClientsDatas();
      }
    } else {
      for (var item in GlobalVariable.ClientsData!.listeHotelNear!) {

        item.lat != null ?
        _con.markers.add(
          Marker(
            markerId: MarkerId(item.id.toString()),
            position: LatLng(double.parse(item.lat.toString()),
                double.parse(item.longe.toString())),
            onTap: () {
              _con.customInfoWindowController.addInfoWindow!(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.appColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                item.description.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                              ),
                            )
                          ],
                        ),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Triangle.isosceles(
                      edge: Edge.BOTTOM,
                      child: Container(
                        color: Colors.blue,
                        width: 20.0,
                        height: 10.0,
                      ),
                    ),
                  ],
                ),
                LatLng(double.parse(item.lat.toString()),
                    double.parse(item.longe.toString())),
              );
            },
          ),
        )  : "";
      }
      return GlobalVariable.ClientsData as ClientsDatas;
    }
  }
}
