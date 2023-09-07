import 'package:flutter/material.dart';
import 'package:get/get.dart';

Text authSubtitle(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Get.isDarkMode ? Colors.white54 : Colors.black.withOpacity(.5),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}

Text authTitle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}
