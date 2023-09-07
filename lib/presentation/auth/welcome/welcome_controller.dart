import 'package:carousel_slider/carousel_controller.dart';
import 'package:hotel_ci/core/app_export.dart';

class WelcomeController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList<Welcome> welcomeList = RxList(
    [
      Welcome(
        image: ImageConstant.wel1,
        title: "selectdestination".tr,
        subtitle:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type."
                .tr,
      ),
      Welcome(
        image: ImageConstant.wel2,
        title: "pickupyourtime".tr,
        subtitle:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type."
                .tr,
      ),
      Welcome(
        image: ImageConstant.wel3,
        title: "enjoyyourtrip".tr,
        subtitle:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type."
                .tr,
      )
    ],
  );
}

class Welcome {
  String image;
  String title;
  String subtitle;

  Welcome({required this.image, required this.title, required this.subtitle});
}
