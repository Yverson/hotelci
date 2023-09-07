import 'package:hotel_ci/core/app_export.dart';

class PaymentController extends GetxController {
  RxInt isSelect = 0.obs;

  RxList<PaymentMethod> paymentList = RxList([
    PaymentMethod(
      logo: ImageConstant.mastercard,
      name: "creditcard".tr,
    ),
    PaymentMethod(
      logo: ImageConstant.paypal,
      name: "paypal".tr,
    ),
    PaymentMethod(
      logo: ImageConstant.applepay,
      name: "applepay".tr,
    )
  ]);
}

class PaymentMethod {
  String logo;
  String name;

  PaymentMethod({
    required this.logo,
    required this.name,
  });
}
