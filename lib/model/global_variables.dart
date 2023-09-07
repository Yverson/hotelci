import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalVariable {
  static String ClientsId = "";
  static String userName = "";
  static String email = "";
  static String password = "";
  static String tel = "";
  static String token = "";
  static bool isLoggedIn = false;
  static var dataCathe = "";
  static bool? presentation = false;
  static User? CurrentUser = null;
  static ClientsDatas? ClientsData = null;
  static Providers? Currenthotel = null;
  static ProvidersService? CurrentChambre = null;
  static ClientCommande? CurrentClientCommande = null;
  static Providers? Nearhotel = null;
  static Providers? discoverseHotel = null;
  static String oneSignaleAppId = "fe26ab2c-e2e1-410c-8c99-6d3c4fbb20c9";
  static String? Latitude;
  static String? longitude;
  static const String apiurl = 'https://glad-oriented-camel.ngrok-free.app/';
  //static const String apiurl = 'http://api.hotels.ci/';
  static const String wsurl = 'ws://api.hotels.ci/';

}

// Methode checkToken pour anciene connexion
Future<void> CheckToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  final String? userName = prefs.getString('userName');
  final String? password = prefs.getString('password');

  if (token != null) {
    GlobalVariable.token = token;
    GlobalVariable.userName = userName!;
    GlobalVariable.isLoggedIn = true;
    GlobalVariable.password = password!;
    Get.toNamed(AppRoutes.bottomBarScreen);
  }

}
