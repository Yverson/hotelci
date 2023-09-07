import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

String baseUrl = GlobalVariable.apiurl;
//String baseUrl = "http://172.20.10.2";
//String baseUrl = "http://api.hotels.ci";

List<ListeHotel> allProviders = [];
// ignore: unnecessary_new
ClientsDatas post = new ClientsDatas(
    latitude: GlobalVariable.Latitude, longetude: GlobalVariable.longitude);

Future<ClientsDatas> fetchProviders() async {
  if (GlobalVariable.ClientsData == null) {
    final Map<String, String> header = {
      'content-type': '	application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + GlobalVariable.token,
    };

    final response = await http.post(Uri.parse("$baseUrl" + 'GetClientsData'),
        body: clientsDataToJson(post), headers: header);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var responseData = json.decode(response.body);

      ClientsDatas? cliData = ClientsDatas.fromJson(responseData);
      GlobalVariable.ClientsData = cliData;
      GlobalVariable.CurrentUser = cliData.currentUser;
      OneSignal.shared.setExternalUserId(GlobalVariable.CurrentUser!.id.toString());

      return cliData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load album');
      return ClientsDatas();
    }
  } else {
    GlobalVariable.CurrentUser = GlobalVariable.ClientsData!.currentUser;
    OneSignal.shared.setExternalUserId(GlobalVariable.CurrentUser!.id.toString());
    return GlobalVariable.ClientsData as ClientsDatas;
  }
}

Future<List<ClientCommande>> fetchCommandes() async {

    final Map<String, String> header = {
      'content-type': '	application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + GlobalVariable.token,
    };

    final response = await http.get(Uri.parse(baseUrl + "HistoryCientCommandes"), headers: header);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var responseData = json.decode(response.body);

      //Creating a list to store input data;
      List<ClientCommande> data = [];
      for (var singleUser in responseData) {
        ClientCommande? r = ClientCommande.fromJson(singleUser);

        //Adding user to the list.
        data.add(r);
      }

      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load album');
      return [];
    }

}
