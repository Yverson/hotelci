import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/addCreditcard/add_credit_card_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_text_field.dart';

class AddCreditCardScreen extends StatelessWidget {
  AddCreditCardScreen({Key? key}) : super(key: key);
  final AddCreditCardController _con = Get.put(AddCreditCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "addcreditcard".tr),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: Get.height / 4,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.appColor.withOpacity(.3),
                  ),
                  child: Image.asset(ImageConstant.creditcard)),
              const SizedBox(height: 40),
              title("cardholdername".tr + ' :'),
              AppTextField(
                hintText: "cardholdername".tr,
                errorMessage: _con.cardHolderName,
                color: Colors.transparent,
                border: true,
              ),
              title("cardnumber".tr + ' :'),
              AppTextField(
                hintText: "cardnumber".tr,
                errorMessage: _con.cardHolderName,
                keyboardType: TextInputType.number,
                color: Colors.transparent,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9]"),
                  ),
                ],
                border: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("cvv".tr + ' :'),
                        AppTextField(
                          color: Colors.transparent,
                          hintText: "cvv".tr,
                          errorMessage: _con.cardHolderName,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          border: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("Expiration Date"),
                        AppTextField(
                          color: Colors.transparent,
                          hintText: "expirationdate".tr + ' :',
                          errorMessage: _con.cardHolderName,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          border: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              title("securitycode".tr + ' :'),
              AppTextField(
                color: Colors.transparent,
                obsecureText: true,
                hintText: "securitycode".tr,
                errorMessage: _con.cardHolderName,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9]"),
                  ),
                ],
                border: true,
              ),
              const SizedBox(height: 50),
              AppButton(
                text: "done".tr,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textGreyColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
