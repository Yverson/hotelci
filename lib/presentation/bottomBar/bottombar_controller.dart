import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class BottomBarController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxInt isTap = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  List icons = [
    [ImageConstant.home, ImageConstant.activehome],
    [ImageConstant.search, ImageConstant.activesearch],
    [ImageConstant.notification2, ImageConstant.activenotification],
    [ImageConstant.profile, ImageConstant.activeprofile],
  ];

  onTap(index) {
    pageIndex.value = index;
  }

  RxList<Drawer> drawerList = RxList([
    Drawer(
      image: ImageConstant.profile3,
      title: "Commentaires".tr,
    ),
    /*Drawer(
      image: ImageConstant.filter,
      title: "filter".tr,
    ),
    Drawer(
      image: ImageConstant.payment,
      title: "payment".tr,
    ),*/
    Drawer(
      image: ImageConstant.history1,
      title: "Mes Reservations".tr,
    ),
    /*Drawer(
      image: ImageConstant.setting1,
      title: "settings".tr,
    ),*/
    Drawer(
      image: ImageConstant.info1,
      title: "Mon profil".tr,
    ),
    Drawer(
      image: ImageConstant.logout,
      title: "logout".tr,
    ),
  ]);
}

class Drawer {
  String? title;
  String? image;

  Drawer({
    required this.title,
    required this.image,
  });
}
