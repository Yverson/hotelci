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
  static String oneSignaleAppId = "28d220d8-4260-4447-b47c-e6017a2ba9e5";
  static String? Latitude;
  static String? longitude;
  static const String apiurl = 'http://api.hotels.ci/';
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
