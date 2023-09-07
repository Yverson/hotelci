import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/chooseRoom/choose_room_controler.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';

class ChooseRoomScreen extends StatelessWidget {
  final ChooseRoomController _con = Get.put(ChooseRoomController());
  ChooseRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
      appBar: appBar(text: "chooseroom".tr),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*CarouselSlider(
                carouselController: _con.carouselController,
                options: CarouselOptions(
                  height: Get.height * 0.5,
                  viewportFraction: 0.95,
                  pauseAutoPlayOnTouch: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    _con.selectedIndex.value = index;
                  },
                ),
                items: List.generate(
                  _con.roomList.length,
                  (index) => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          right: 10,
                          left: 0,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                _con.roomList[index].title!,
                                style: const TextStyle(
                                  height: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      right: 10,
                      left: 0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: Get.width,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: GlobalVariable.CurrentChambre!.icone != null ? NetworkImage(GlobalVariable.CurrentChambre!.icone.toString()) : AssetImage(ImageConstant.image) as ImageProvider ,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            GlobalVariable.CurrentChambre!.description.toString(),
                            style: const TextStyle(
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              /*const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        // left: 20,
                        right: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode ? Colors.transparent : Colors.white,
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstant.wifi,
                            color: AppColors.appColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'freewifi'.tr,
                            style: TextStyle(
                              color: AppColors.textGreyColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),*/
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Text(
                      GlobalVariable.CurrentChambre!.description.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: GlobalVariable.CurrentChambre!.prixVente.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '/night'.tr,
                              style: TextStyle(
                                color: AppColors.textGreyColor,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              /*Text(
                '2nd Floor',
                style: TextStyle(
                  color: AppColors.textGreyColor,
                ),
              ),*/
              const SizedBox(height: 10),
              Text(
                GlobalVariable.CurrentChambre!.observation.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.5,
                  color: AppColors.textGreyColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: Get.height * 0.2),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: Get.height * 0.15,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                    text: "booknow".tr,
                        onPressed:  () {

                          ClientCommande clientCmd = new ClientCommande();
                          clientCmd.quantite = "1";
                          clientCmd.prixVente = GlobalVariable.CurrentChambre!.prixVente;
                          clientCmd.montant = GlobalVariable.CurrentChambre!.prixVente;
                          clientCmd.dateDebut = DateTime.now().add(const Duration(days: 1));
                          clientCmd.dateFin = DateTime.now().add(const Duration(days: 2));

                          GlobalVariable.CurrentClientCommande = clientCmd;

                          Get.toNamed(AppRoutes.bookingScreen);

                        },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
