import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_ci/model/global_variables.dart';

class LoginRegisterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController?> tabController = Rx(null);
  RxInt selectedIndex = 0.obs;

  RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    CheckToken();
    tabController = Rx(
      TabController(
        length: 2,
        vsync: this,
        initialIndex: 0,
      ),
    );

    tabController.value!.addListener(() {
      selectedIndex.value = tabController.value!.index;
    });
  }
}
