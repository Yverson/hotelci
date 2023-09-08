// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_time_patterns.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = GlobalVariable.apiurl;
//String baseUrl = "http://172.20.10.2";
//String baseUrl = "http://api.hotels.ci";

/*Future<List<>> getPosts() async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + GlobalVariable.token,
  };
  final response =
      await http.get(Uri.parse("$baseUrl/Categories"), headers: header);
  return postFromJson(response.body);
}*/

//envoie d'info a l'API
Future<http.Response> createPost(PostRegister post) async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    //'Authorization': 'Bearer ' + GlobalVariable.token,
  };

  post.password = "";
  final reponse = await http.post(Uri.parse("$baseUrl" + "Identity/Register"),
      body: postRegisterToJson(post), headers: header);

  if (reponse.statusCode == 200) {
    var data = jsonDecode(reponse.body.toString());
    GlobalVariable.token = data["Token"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", "");
    await prefs.setString("userName", "");
    await prefs.setString("password", "");
    await prefs.setString("email", "");
    await prefs.setString("tel", "");

    await prefs.setString("token", GlobalVariable.token);
    await prefs.setString("userName", post.userName.toString());
    await prefs.setString("Password", post.password.toString());
    await prefs.setString("email", post.email.toString());
    await prefs.setString("tel", post.tel.toString());
  }
  return reponse;
}

// Post de verification Login
Future<http.Response> LoginUser(PostRegister post) async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
  };

  post.password = "";
  final response = await http.post(Uri.parse("$baseUrl" + "Identity/Login"),
      headers: header, body: postRegisterToJson(post));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    GlobalVariable.token = data["Token"];
    GlobalVariable.userName = post.tel.toString();
    GlobalVariable.password = post.password.toString();
// enregistrement des donnee de connection dans le cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", GlobalVariable.token);
    await prefs.setString("userName", post.userName.toString());
    await prefs.setString("password", post.password.toString());
  } else {
    print('failed');
  }
  return response;
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }


  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  GlobalVariable.Latitude = position.latitude.toString();
  GlobalVariable.longitude = position.longitude.toString();

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return position;
}

userPostion() async {
  Position position = await _determinePosition();
}

//Post Client Commande
Future<http.Response> createPostClientCommande() async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + GlobalVariable.token,
  };
  ClientCommande clientCmd = GlobalVariable.CurrentClientCommande!;
  clientCmd.date = DateTime.now();
  clientCmd.dateOnly = DateTime.now();
  clientCmd.created = DateTime.now();
  clientCmd.modified = DateTime.now();
  clientCmd.client = GlobalVariable.userName.toString();
  clientCmd.dlat = GlobalVariable.Currenthotel!.lat.toString();
  clientCmd.dlong = GlobalVariable.Currenthotel!.longe.toString();
  clientCmd.contact = GlobalVariable.userName.toString();
  clientCmd.providersId =
      GlobalVariable.Currenthotel!.id.toString();

  var encodeData = json.encode(clientCmd);

  final reponse = await http.post(Uri.parse("$baseUrl" + "ClientCommandes"),
      headers: header, body: encodeData);

  if (reponse.statusCode == 200) {
    var data = jsonDecode(reponse.body.toString());

  }
  return reponse;
}

//Post User
Future<User> createUser() async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + GlobalVariable.token,
  };
  User clientCmd = GlobalVariable.CurrentUser!;

  var encodeData = json.encode(clientCmd);

  final reponse = await http.put(Uri.parse("$baseUrl" + "User"),
      headers: header, body: encodeData);

  if (reponse.statusCode == 200) {
    //var data = jsonDecode(reponse.body.toString());

    var responseData = json.decode(reponse.body);

    GlobalVariable.CurrentUser = User.fromJson(responseData);

  }
  return GlobalVariable.CurrentUser!;
}

//envoie d'info a l'API
Future<http.Response> sendStatistiques(Statistiques post) async {
  final Map<String, String> header = {
    'content-type': '	application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + GlobalVariable.token,
  };

  final reponse = await http.post(Uri.parse("$baseUrl" + "SendStatistiques"),
      body: StatistiquesToJson(post), headers: header);

  if (reponse.statusCode == 200) {

  }
  return reponse;
}
