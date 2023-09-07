import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_button.dart';
import 'package:hotel_ci/presentation/payment/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final PaymentController _con = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "payment".tr),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.paymentImage,
                height: Get.height / 3.5,
                width: Get.width,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addCreditCardScreen);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.textGreyColor,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "addnewaddress".tr,
                        style: TextStyle(color: AppColors.textGreyColor),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageConstant.homelocation,
                          height: 25,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "homelocation".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Prospect, Saint James, Barbados \nN/A - 125465 \n(1-246) 425-1091",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.done,
                            size: 16,
                            color: AppColors.appColor,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              Text(
                "selectcard".tr + ':',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _con.paymentList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        _con.isSelect.value = index;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Image.asset(_con.paymentList[index].logo),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              _con.paymentList[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            _con.isSelect.value == index
                                ? Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.appColor,
                                  )
                                : Icon(
                                    Icons.radio_button_unchecked,
                                    color: AppColors.borderColor,
                                  )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              AppButton(
                text: "pay".tr,
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
