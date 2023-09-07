import 'package:hotel_ci/core/app_export.dart';

import 'splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashController(),
    );
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Center(
          child: Image.asset(
            ImageConstant.splashIcon,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
