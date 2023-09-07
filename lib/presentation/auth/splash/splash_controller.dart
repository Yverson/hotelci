import 'package:hotel_ci/model/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/app_export.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      CheckPresentation();
    });
    super.onInit();
  }

  Future<void> CheckPresentation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? estPresenter = prefs.getBool('presentation');
    GlobalVariable.presentation = estPresenter;
    if (GlobalVariable.presentation == true) {
      Get.toNamed(AppRoutes.loginRegisterScreen);
      //  prefs.setBool('presentation', false);
    } else {
      Get.offNamed(AppRoutes.welcomeScreen);
    }
  }
}
