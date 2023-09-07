import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/home/liste_hotels.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "Mes reservations".tr),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child:
        FutureBuilder(
          future: fetchCommandes(),
          builder: (context, snapshot) {
            if (snapshot.hasError == true) {
              return Center(
                child: Text(snapshot.hasError.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              var reponse = snapshot.data as List<ClientCommande>;
              return ListView.builder(
                itemCount: reponse.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {

                  ClientCommande postItem = reponse[index] as ClientCommande;

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.transparent : Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10),
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
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: postItem.providers!.photo != null ? NetworkImage(postItem.providers!.photo.toString()) : AssetImage(ImageConstant.image) as ImageProvider ,
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
                                      postItem.providers!.description.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      postItem.providers!.adresse.toString(),
                                      style: TextStyle(
                                        color: AppColors.textGreyColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    postItem.montant.toString(),
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
                                        postItem.status.toString(),
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
          },
        ),
      ),
    );
  }
}
