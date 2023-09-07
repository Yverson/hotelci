// import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_ci/model/global_variables.dart';

class NearYouMapMapController extends GetxController {
  RxBool isLoading = false.obs;
  List<Marker> customMarkers = [];
  late final AnimationController? animationController;
  final LatLng latLng = LatLng(double.parse(GlobalVariable.Latitude.toString()),
      double.parse(GlobalVariable.longitude.toString()));
  final double zoom = 15.0;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  Set<Marker> markers = {};

  @override
  void dispose() {
    customInfoWindowController.dispose();
    super.dispose();
  }
}
