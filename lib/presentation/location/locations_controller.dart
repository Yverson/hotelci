import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_ci/core/app_export.dart';

class LocationsController extends GetxController {
  RxBool isLoading = false.obs;
  List<Marker> customMarkers = [];
  late final AnimationController? animationController;
  final LatLng latLng = const LatLng(28.7041, 77.1025);
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
