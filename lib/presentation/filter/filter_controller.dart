import 'package:get/get.dart';

class FilterController extends GetxController {
  // RxList onSelectTypeList = [].obs;
  // RxDouble rangeValue = (0.0).obs;
  double lowerValue = 0;
  double upperValue = 150;
  RxInt isSelect = 0.obs;
  RxBool isSelected = false.obs;

  List categoryList = [
    'all'.tr,
    'popular'.tr,
    'sale'.tr,
    'luxury'.tr,
  ];

  // onSelectType(int index) {
  //   if (onSelectTypeList.contains(index)) {
  //     onSelectTypeList.remove(index);
  //   } else {
  //     onSelectTypeList.add(index);
  //   }
  // }

  getFacilities() {
    RxList list = RxList([
      Facilities(
        id: 1,
        name: "freewifi".tr,
      ),
      Facilities(
        id: 2,
        name: "parkingarea".tr,
      ),
      Facilities(
        id: 3,
        name: "breakfirstmenu".tr,
      ),
      Facilities(
        id: 4,
        name: "2 "+'bedroom'.tr,
      ),
    ]);
    return list;
  }

  RxList facilitiesList = RxList([]);
  RxList selectitem = RxList([]);
  @override
  void onInit() {
    facilitiesList = getFacilities();
    super.onInit();
  }
}

class Facilities {
  final int id;
  final String name;
  Facilities({
    required this.id,
    required this.name,
  });
}
