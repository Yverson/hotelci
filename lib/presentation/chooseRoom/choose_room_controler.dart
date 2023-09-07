import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:hotel_ci/core/utils/image_constant.dart';

class ChooseRoomController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  RxList<ChooseRoom> roomList = RxList([
    ChooseRoom(
      title: "Bedroom",
      image: ImageConstant.image,
    ),
    ChooseRoom(
      title: "Bedroom",
      image: ImageConstant.image,
    ),
    ChooseRoom(
      title: "Bedroom",
      image: ImageConstant.image,
    ),
  ]);
}

class ChooseRoom {
  String? title;
  String? image;

  ChooseRoom({
    required this.title,
    required this.image,
  });
}
