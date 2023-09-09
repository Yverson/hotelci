import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/api.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/search_box.dart';
import 'package:hotel_ci/presentation/home/home_controller.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';
import 'package:hotel_ci/presentation/support/support_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final HomeScreenController _con = Get.put(HomeScreenController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    userPostion();
    super.initState();
    initPlatformState(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: FutureBuilder(
              future: fetchProviders(),
              builder: (context, snapshot) {
                if (snapshot.hasError == true) {
                  return Center(
                    child: Text(snapshot.hasError.toString()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var reponse = snapshot.data as ClientsDatas;

                  return
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: Text(
                              'Salut ' + GlobalVariable.CurrentUser!.UserName.toString(),
                              style: const TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 15),
                              /*SizedBox(
                                height: 45,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: reponse.listeHotel!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, position) {
                                      Providers postItem =
                                      reponse.listeHotel![position];
                                      return Container(
                                        alignment: Alignment.center,
                                        margin:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color:
                                            AppColors.textGreyColor.withOpacity(.5),
                                          ),
                                        ),
                                        child: Text(
                                          postItem.description.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color(0xff9E9E9E),
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    }),
                              ),*/
                              const SizedBox(height: 15),
                              commonText('discover'.tr, 'seeall'.tr),
                              SizedBox(
                                  height: Get.height * 0.36,
                                  width: Get.width,
                                  child: ListView.builder(
                                    itemCount: reponse.discoverseHotel!.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, position) {
                                      Providers postItem =
                                      reponse.discoverseHotel![position];
                                      return GestureDetector(
                                          onTap: (() async {
                                            GlobalVariable.discoverseHotel = postItem;
                                            GlobalVariable.Currenthotel = postItem;

                                            try
                                            {
                                              Statistiques stat = new Statistiques();
                                              stat.AspNetUsersId = GlobalVariable.CurrentUser!.id;
                                              stat.Utilisateur = GlobalVariable.CurrentUser!.UserName;
                                              stat.ProvidersId = postItem.id;
                                              stat.Provider = postItem.noms;
                                              stat.Quantite = 1;
                                              stat.Type = "VISITE";
                                              stat.Description = "L'utilisateur " + stat.Utilisateur.toString() + " a visité votre Profil";
                                              await sendStatistiques(stat);

                                            }catch(error)
                                            { }

                                            Get.toNamed(AppRoutes.homeDetailScreen);
                                          }),
                                          child: Container(
                                            width: Get.width * 0.72,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: postItem.photo != null ? NetworkImage(postItem.photo.toString()) : AssetImage(ImageConstant.image) as ImageProvider ,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 15),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                        height: 30,
                                                        width: 110,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(30),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            Image.asset(
                                                              ImageConstant.info2,
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              '0 ' + 'views'.tr,
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors.black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      /*Image.asset(
                                                ImageConstant.fav,
                                                height: 20,
                                              ),*/
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20, vertical: 5),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Text(
                                                              postItem.description
                                                                  .toString(),
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                        ),
                                                      ),
                                                      /*Image.asset(
                                                ImageConstant.star,
                                                height: 16,
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                '4.8',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),*/
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                    },
                                  )),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'nearyou'.tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(AppRoutes.nearYouMapScreen);
                                          },
                                          child: Text(
                                            'onmap'.tr,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffEE7373),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //const SizedBox(height: 5),
                                    /*Text(
                              'centralareasingapore'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textGreyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),*/
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView.builder(
                                    itemCount: reponse.listeHotelNear!.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: ((context, position) {
                                      Providers postItem =
                                      reponse.listeHotelNear![position];

                                      return GestureDetector(
                                          onTap: (() async {

                                            GlobalVariable.Nearhotel = postItem;
                                            GlobalVariable.Currenthotel = postItem;

                                            try
                                            {
                                              Statistiques stat = new Statistiques();
                                              stat.AspNetUsersId = GlobalVariable.CurrentUser!.id;
                                              stat.Utilisateur = GlobalVariable.CurrentUser!.UserName;
                                              stat.ProvidersId = postItem.id;
                                              stat.Provider = postItem.noms;
                                              stat.Quantite = 1;
                                              stat.Type = "VISITE";
                                              stat.Description = "L'utilisateur " + stat.Utilisateur.toString() + " a visité votre Profil";
                                              await sendStatistiques(stat);

                                            }catch(error)
                                            { }

                                            Get.toNamed(AppRoutes.homeDetailScreen);
                                          }),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            width: Get.width,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: postItem.photo != null ? NetworkImage(postItem.photo.toString()) : AssetImage(ImageConstant.image) as ImageProvider ,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
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

                                                          // SizedBox(width: Get.width),
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
                                                            postItem.fonction
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .textGreyColor,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // const SizedBox(height: 5),
                                                      /*Row(
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: '\$45',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
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
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      '8 ' + 'roomavailable'.tr,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff27AE60),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),*/
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                    }),
                                  )),
                            ],
                          )

                        ]
                    );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
      ),
    );
  }


}

commonText(
  String? text,
  String? text1,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.discoverScreen);
          },
          child: Row(
            children: [
              Text(
                text1!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textGreyColor,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Future<void> initPlatformState(BuildContext context) async {

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId(GlobalVariable.oneSignaleAppId);

//c'est celui qui te permet de ajouter un Id unique dans la base de données
   OneSignal.shared.setExternalUserId(GlobalVariable.Id.toString());

  //Celui pour demander la permission a l utilisateur de utiliser les notification
  // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) async {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      // Play a sound as a one-shot, releasing its resources when it finishes playing.

      if (event.notification != null &&
          event.notification.additionalData != null) {
        var data = event.notification.additionalData;

        if (data!["status"] != null && data!["status"] == "EN ATTENTE DE PAIEMENT") {
          //result.complete(result.notification);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SupportScreen(Id: data!["ridesid"], Montant: data!["montant"] ),
              ) );

        }

      } else {
        event.complete(event.notification);
      }

      event.complete(event.notification);
    });

    OneSignal.shared.setNotificationOpenedHandler(
        (OSNotificationOpenedResult result) async {
      // Will be called whenever a notification is opened/button pressed.
      print(result.notification);

      if (result.notification != null &&
          result.notification.additionalData != null) {
        var data = result.notification.additionalData;

        //if (data!["status"] != null && data!["status"] == "TERMINER") {
        //result.complete(result.notification);
        //  GlobalVariables.destination = null;
        //  GlobalVariables.destinationName = "";
        //showDialog(context: context, builder: (context) => RateRideDialog());

        //}

      } else {}
    });
  });
}


ClientCommande? commande = null;
Future<ClientCommande?> fetchCommandes(String id) async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + GlobalVariable.token,
  };

  final response = await http.get(
      Uri.parse(GlobalVariable.apiurl + 'HistoryCommandes/' + id),
      headers: header);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var responseData = json.decode(response.body);

    commande = ClientCommande.fromJson(responseData);

    return commande;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    //throw Exception('Failed to load album');
    return null;
  }
}

