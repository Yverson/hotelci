import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalVariable {
  static String Id = "";
  static String ClientsId = "";
  static String name = "";
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

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    GlobalVariable.Id = decodedToken["nameid"];
    GlobalVariable.name = decodedToken["Noms"];

    /* isExpired() - you can use this method to know if your token is already expired or not.
  An useful method when you have to handle sessions and you want the user
  to authenticate if has an expired token */
    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (!isTokenExpired) {
      // The user should authenticate
      Get.toNamed(AppRoutes.loginRegisterScreen);
    }

    /* getExpirationDate() - this method returns the expiration date of the token */
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);

    // 2025-01-13 13:04:18.000
    print(expirationDate);

    /* getTokenTime() - You can use this method to know how old your token is */
    Duration tokenTime = JwtDecoder.getTokenTime(token);

    // 15
    print(tokenTime.inDays);

    Get.toNamed(AppRoutes.bottomBarScreen);
  }

}
