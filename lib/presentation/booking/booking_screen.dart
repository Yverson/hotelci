import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/api.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:hotel_ci/presentation/booking/booking_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({Key? key}) : super(key: key);
  final BookingController _con = Get.put(BookingController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "booking".tr),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commanText(GlobalVariable.CurrentChambre!.description.toString()),
                const SizedBox(height: 20),
/*                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _con.firstName,
                        radius: 5,
                        color: Colors.transparent,
                        border: true,
                        hintText: "fastname".tr,
                        errorMessage: _con.firstNameError,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextField(
                        controller: _con.lastName,
                        radius: 5,
                        color: Colors.transparent,
                        border: true,
                        hintText: "lastname".tr,
                        errorMessage: _con.lastNameError,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _con.email,
                        radius: 5,
                        border: true,
                        color: Colors.transparent,
                        hintText: "email".tr,
                        errorMessage: _con.emailError,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextField(
                        controller: _con.phoneNo,
                        radius: 5,
                        border: true,
                        color: Colors.transparent,
                        hintText: "phoneno".tr,
                        errorMessage: _con.phoneNoError,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),*/
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "arrival".tr,
                              style: TextStyle(
                                color: AppColors.textGreyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          AppTextField(
                            controller: _con.arrivalDate,
                            initialValue: _con.arrivalDate.text,
                            radius: 5,
                            border: true,
                            hintText: "",
                            color: Colors.transparent,
                            errorMessage: _con.arrivalDateError,
                            suffixIcon: ImageConstant.calander,
                            ontap: () => _con.arrivalDatePicker(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "departure".tr,
                              style: TextStyle(
                                color: AppColors.textGreyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          AppTextField(
                            controller: _con.departureDate,
                            initialValue: _con.departureDate.text,
                            radius: 5,
                            border: true,
                            hintText: "",
                            color: Colors.transparent,
                            errorMessage: _con.departureDateError,
                            suffixIcon: ImageConstant.calander,
                            ontap: () => _con.departureDatePicker(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                /*const SizedBox(height: 20),
                commanText("standardsingleroom".tr),
                const SizedBox(height: 20),
                viewDetail(),
                const SizedBox(height: 20),
                commanText("additionalservice".tr),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    additionservice(
                      logo: ImageConstant.gym,
                      service: "gym".tr,
                      price: "\$50.00",
                    ),
                    additionservice(
                      logo: ImageConstant.spa,
                      service: "spa".tr,
                      price: "\$50.00",
                    ),
                    additionservice(
                      logo: ImageConstant.restaurant,
                      service: "restaurant".tr,
                      price: "\$50.00",
                    ),
                    additionservice(
                      logo: ImageConstant.parking,
                      service: "parking".tr,
                      price: "\$50.00",
                    ),
                  ],
                ),*/
                const SizedBox(height: 20),
                commanText("payment".tr),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        _con.quantite.value +
                            " x " +
                            GlobalVariable.CurrentChambre!.description
                                .toString() +
                            "",
                        style: TextStyle(
                          color: AppColors.textGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      GlobalVariable.CurrentClientCommande!.prixVente
                          .toString(),
                      style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Color(0xff9196B2),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "total".tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Obx(
                      () => Text(
                        _con.montant.value,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.appColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                AppButton(
                  text: "Confirmer".tr,
                  onPressed: () async {

                    if(_con.IsEnable.value == true)
                      {
                        _con.IsEnable.value = false;
                        GlobalVariable.CurrentClientCommande!.status = "EN ATTENTE DE CONFIRMATION";

                        await createPostClientCommande();

                        GlobalVariable.Currenthotel = null;
                        GlobalVariable.CurrentChambre = null;
                        GlobalVariable.CurrentClientCommande = null;

                        Get.toNamed(AppRoutes.bottomBarScreen);

                        _con.IsEnable.value = true;
                      }

                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row payment({required String details, required String price}) {
    return Row(
      children: [
        Text(
          details,
          style: TextStyle(
            color: AppColors.textGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
            color: AppColors.textGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Column additionservice(
      {required String logo, required String service, required String price}) {
    return Column(
      children: [
        Image.asset(
          logo,
          height: 30,
          width: 30,
        ),
        const SizedBox(height: 5),
        Text(
          service,
          style: TextStyle(
            color: AppColors.textGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          price,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Container viewDetail() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: Get.width,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.transparent : Colors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text(
            "\$79 / " + 'night'.tr,
            style: TextStyle(
              color: Get.isDarkMode
                  ? Colors.white54
                  : Colors.black.withOpacity(.5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            "viewdetails".tr,
            style: TextStyle(
              color: AppColors.appColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.east,
            size: 20,
            color: AppColors.appColor,
          )
        ],
      ),
    );
  }

  Text commanText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
