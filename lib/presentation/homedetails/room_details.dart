import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/api.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({Key? key}) : super(key: key);

  @override
  _HomeDetailScreen createState() => _HomeDetailScreen();
}

class _HomeDetailScreen extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "details".tr,
        backgroundColor: Colors.transparent,
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
            ),
            Container(
              height: Get.height / 2,
              width: Get.width,
              color: AppColors.appColor.withOpacity(0.2),
              child: GlobalVariable.Currenthotel!.photo == null ? Image.asset(
                ImageConstant.image,
                height: Get.height,
                fit: BoxFit.cover,
                width: Get.width,
              ) :
              Image.network(
                GlobalVariable.Currenthotel!.photo.toString(),
                height: Get.height,
                fit: BoxFit.cover,
                width: Get.width,
              )
        ,
            ),
            Positioned(
              top: Get.height / 2.5,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color:
                      Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              GlobalVariable.Currenthotel != null
                                  ? GlobalVariable.Currenthotel!.description
                                      .toString()
                                  : '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {

                              try
                              {
                                Statistiques stat = new Statistiques();
                                stat.AspNetUsersId = GlobalVariable.CurrentUser!.id;
                                stat.Utilisateur = GlobalVariable.CurrentUser!.UserName;
                                stat.ProvidersId = GlobalVariable.Currenthotel!.id;
                                stat.Provider = GlobalVariable.Currenthotel!.noms;
                                stat.Quantite = 1;
                                stat.Type = "CONTACT";
                                stat.Description = "L'utilisateur " + stat.Utilisateur.toString() + " a recuperer votre numero depuis notre plateforme.";
                                await sendStatistiques(stat);

                              }catch(error)
                              { }

                              await _makePhoneCall("+225" +
                                  GlobalVariable.Currenthotel!.contact1
                                      .toString());
                            },
                            child: Icon(
                              Icons.phone,
                              size: 20,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImageConstant.location2,
                            height: 15,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              GlobalVariable.Currenthotel != null
                                  ? GlobalVariable.Currenthotel!.adresse
                                      .toString()
                                  : '',
                              style: TextStyle(
                                color: AppColors.textGreyColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            'Appeler'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          StarRating(
                            onRatingChanged: (val) {},
                            color: Colors.amber,
                            rating: 4,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: '4.0',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' (Review-120) ',
                                      style: TextStyle(
                                        color: AppColors.textGreyColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'facilities'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      getTextWidgets(GlobalVariable.Currenthotel!.installations!),
                      const SizedBox(height: 10),
                      Text(
                        "Mes Chambres",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: GlobalVariable
                                .Currenthotel!.providersServices!.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: ((context, position) {
                              ProvidersService postItem = GlobalVariable
                                  .Currenthotel!.providersServices![position];

                              return postItem.etat == "ACTIF" ? GestureDetector(
                                  onTap: (() async {
                                    //GlobalVariable.Nearhotel = postItem;
                                    GlobalVariable.CurrentChambre = postItem;

                                    try
                                    {
                                      Statistiques stat = new Statistiques();
                                      stat.AspNetUsersId = GlobalVariable.CurrentUser!.id;
                                      stat.Utilisateur = GlobalVariable.CurrentUser!.UserName;
                                      stat.ProvidersId = GlobalVariable.Currenthotel!.id;
                                      stat.Provider = GlobalVariable.Currenthotel!.noms;
                                      stat.Quantite = 1;
                                      stat.Type = "VISITE";
                                      stat.Description = "L'utilisateur " + stat.Utilisateur.toString() + " est interessé par la chambre " + GlobalVariable.CurrentChambre!.description.toString();
                                      await sendStatistiques(stat);

                                    }catch(error)
                                    { }

                                    Get.toNamed(AppRoutes.chooseRoomScreen);
                                  }),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          //width: Get.width,
                                          color: AppColors.appColor.withOpacity(0.2),
                                          child: postItem.icone == null ? Image.asset(
                                            ImageConstant.image,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ) :
                                          Image.network(
                                            postItem.icone.toString(),
                                            height: 40,
                                            fit: BoxFit.cover,
                                          )
                                          ,
                                        ),
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
                                                        color: Get.isDarkMode ? AppColors.backgroundColor : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(width: Get.width),
                                                  Text(
                                                    postItem.prixVente
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Get.isDarkMode ? AppColors.backgroundColor : Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )) : null;
                            }),
                          )),
                    ],
                  ),
                ),
              ),
            ),

            /*Positioned(
            top: Get.height / 1.6,
            child: Container(
              height: Get.height / 1.5,
              width: Get.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppButton(
                          width: Get.width / 2.3,
                          text: "Reserver".tr,
                          onPressed: () {

                            //Get.toNamed(AppRoutes.chooseRoomScreen);

                            //GlobalVariable.Currenthotel =
                            //createPostClientCommande() as Providers?;
                          }),
                    ),
                    Expanded(
                      child: AppButton(
                          width: Get.width / 2.3,
                          text: "Appeler".tr,
                        color: Colors.blueGrey,
                        onPressed: ()   async {
                          await _makePhoneCall("+225" + GlobalVariable.Currenthotel!.contact1.toString());
                        },
                    ),
                    ),
                  ]
              ),
            ),
          ),*/
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<Installations> installations)
  {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: installations.map((item) => Column(
          children: [
            item.icone !=  null  ? Image.asset(
                  item.icone!,
                  height: 18,
                  color: AppColors.textGreyColor,
                ) : Container(),
                const SizedBox(height: 5),
                Text(
                  item.description.toString(),
                  style: TextStyle(
                    color: AppColors.textGreyColor,
                    fontSize: 10,
                  ),
                ),

          ],
        )).toList()
    );
  }

  commonFacilities({
    String? image,
    String? text,
  }) {
    return Column(
      children: [
        Image.asset(
          image!,
          height: 18,
          color: AppColors.textGreyColor,
        ),
        const SizedBox(height: 5),
        Text(
          text!,
          style: TextStyle(
            color: AppColors.textGreyColor,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
