import 'package:hotel_ci/core/app_export.dart';

class TermsConditionScreenController extends GetxController {
  RxBool isTC = false.obs;
  RxBool ispolicy = false.obs;
  RxString searchText = "".obs;
  RxBool isSearch = false.obs;
  RxBool isLoading = false.obs;
  RxBool noData = false.obs;
  // CategoryModel? categoryModel;
  List termsConditionList = [
    {
      "id": 1,
      "subTitle": '1. '+ "termsandcondition".tr,
      "description":
          "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    },
    {
      "id": 2,
      "subTitle": '2. '+"privacypolicy".tr,
      "description":
          "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    },
  ];
}
