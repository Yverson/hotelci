import 'package:flutter/material.dart';
import 'package:get/get.dart';

double getSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}
