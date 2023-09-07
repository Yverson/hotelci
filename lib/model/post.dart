import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final postRegister = postRegisterFromJson(jsonString);

import 'dart:convert';

Statistiques StatistiquesFromJson(String str) =>
    Statistiques.fromJson(json.decode(str));

String StatistiquesToJson(Statistiques data) {
  return json.encode(data.toJson());
}

class Statistiques {
  Statistiques({
    this.Provider,
    this.Utilisateur,
    this.Description,
    this.Type,
    this.Quantite,
    this.AspNetUsersId,
    this.ProvidersId,
  });

  String? Provider;
  String? Utilisateur;
  String? Description;
  String? Type;
  int? Quantite;
  String? AspNetUsersId;
  String? ProvidersId;

  factory Statistiques.fromJson(Map<String, dynamic> json) => Statistiques(
    Provider: json["Provider"],
    Utilisateur: json["Utilisateur"],
    Description: json["Description"],
    Type: json["Type"],
    Quantite: json["Quantite"],
    AspNetUsersId: json["AspNetUsersId"],
    ProvidersId: json["ProvidersId"],
  );

  Map<String, dynamic> toJson() => {
    "Provider": Provider,
    "Utilisateur": Utilisateur,
    "Description": Description,
    "Type": Type,
    "Quantite": Quantite,
    "AspNetUsersId": AspNetUsersId,
    "ProvidersId": ProvidersId,
  };
}

PostRegister postRegisterFromJson(String str) =>
    PostRegister.fromJson(json.decode(str));

String postRegisterToJson(PostRegister data) {
  return json.encode(data.toJson());
}

class PostRegister {
  PostRegister({
    this.tel,
    this.email,
    this.userName,
    this.password,
    this.type,
    this.noms,
    this.civilite,
    this.fonction,
    this.age,
    this.marques,
    this.modele,
    this.matricule,
    this.compagniesId,
    this.numeroPiece,
    this.photo,
  });

  String? tel;
  String? email;
  String? userName;
  String? password;
  int? type;
  String? noms;
  String? civilite;
  String? fonction;
  int? age;
  String? marques;
  String? modele;
  String? matricule;
  String? compagniesId;
  String? numeroPiece;
  String? photo;

  factory PostRegister.fromJson(Map<String, dynamic> json) => PostRegister(
        tel: json["tel"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
        type: json["type"],
        noms: json["noms"],
        civilite: json["civilite"],
        fonction: json["fonction"],
        age: json["age"],
        marques: json["marques"],
        modele: json["modele"],
        matricule: json["matricule"],
        compagniesId: json["compagniesId"],
        numeroPiece: json["numeroPiece"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "tel": tel,
        "email": email,
        "userName": userName,
        "password": password,
        "type": type,
        "noms": noms,
        "civilite": civilite,
        "fonction": fonction,
        "age": age,
        "marques": marques,
        "modele": modele,
        "matricule": matricule,
        "compagniesId": compagniesId,
        "numeroPiece": numeroPiece,
        "photo": photo,
      };
}

//Class client
ClientsDatas clientsDataFromJson(String str) =>
    ClientsDatas.fromJson(json.decode(str));

String clientsDataToJson(ClientsDatas data) => json.encode(data.toJson());

class ClientsDatas {
  ClientsDatas({
    this.providers,
    this.currentUser,
    this.listeHotel,
    this.listeHotelNear,
    this.discoverseHotel,
    this.favorisHotel,
    this.latitude,
    this.longetude,
    this.status,
    this.locations,
  });

  User? currentUser;
  List<Providers>? providers;
  List<Providers>? listeHotel;
  List<Providers>? listeHotelNear;
  List<Providers>? discoverseHotel;
  List<Providers>? favorisHotel;
  String? latitude;
  String? longetude;
  String? status;
  String? locations;
  ClientsDatas copyWith({
    required User currentUser,
    required List<Providers> providers,
    required List<Providers> listeHotel,
    required List<Providers> listeHotelNear,
    required List<Providers> discoverseHotel,
    required List<Providers>? favorisHotel,
  }) =>
      ClientsDatas(
        currentUser: currentUser ?? this.currentUser,
        providers: providers ?? this.providers,
        listeHotel: listeHotel ?? this.listeHotel,
        listeHotelNear: listeHotelNear ?? this.listeHotelNear,
        discoverseHotel: discoverseHotel ?? this.discoverseHotel,
        favorisHotel: favorisHotel ?? this.favorisHotel,
      );

  factory ClientsDatas.fromJson(Map<String, dynamic> json) => ClientsDatas(

    currentUser: User.fromJson(json["CurrentUser"]),
        providers: json["Providers"] == null
            ? null
            : List<Providers>.from(
                json["Providers"].map((x) => Providers.fromJson(x))),
        listeHotel: json["ListeHotel"] == null
            ? null
            : List<Providers>.from(
                json["ListeHotel"].map((x) => Providers.fromJson(x))),
        listeHotelNear: json["ListeHotelNear"] == null
            ? null
            : List<Providers>.from(
                json["ListeHotelNear"].map((x) => Providers.fromJson(x))),
        discoverseHotel: json["DiscoverseHotel"] == null
            ? null
            : List<Providers>.from(json["DiscoverseHotel"]
                .map((x) => Providers.fromJson(x))),
        favorisHotel: json["FavorisHotel"] == null
            ? null
            : List<Providers>.from(
                json["FavorisHotel"].map((x) => Providers.fromJson(x))),
        latitude: json["latitude"],
        longetude: json["longetude"],
        status: json["status"],
        locations: json["locations"],

      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longetude": longetude,
        "status": status,
        "locations": locations,
        "providers": providers == null
            ? null
            : List<dynamic>.from(providers!.map((x) => x.toJson())),
        "listeHotel": listeHotel == null
            ? null
            : List<dynamic>.from(listeHotel!.map((x) => x.toJson())),
        "listeHotelNear": listeHotelNear == null
            ? null
            : List<dynamic>.from(listeHotelNear!.map((x) => x.toJson())),
        "discoverseHotel": discoverseHotel == null
            ? null
            : List<dynamic>.from(discoverseHotel!.map((x) => x.toJson())),
        "favorisHotel": favorisHotel == null
            ? null
            : List<dynamic>.from(favorisHotel!.map((x) => x.toJson())),
      };
}

//Type cars
class ListeHotel {
  ListeHotel({
    this.id,
    this.compagniesId,
    this.aspNetUsersId,
    this.description,
    this.horaires,
    this.apropos,
    this.adresse,
    this.contact1,
    this.contact2,
    this.noms,
    this.prenoms,
    this.civilite,
    this.fonction,
    this.photo,
    this.email,
    this.lat,
    this.longe,
    this.status,
    this.location,
    this.note,
    this.etat,
  });

  String? id;
  String? compagniesId;
  String? aspNetUsersId;
  String? description;
  String? horaires;
  String? apropos;
  String? adresse;
  String? contact1;
  String? contact2;
  String? noms;
  String? prenoms;
  String? civilite;
  String? fonction;
  String? photo;
  String? email;
  double? lat;
  double? longe;
  String? status;
  String? location;
  String? note;
  String? etat;

  factory ListeHotel.fromJson(Map<String, dynamic> json) => ListeHotel(
        id: json["Id"] == null ? null : json["Id"],
        compagniesId:
            json["CompagniesId"] == null ? null : json["CompagniesId"],
        aspNetUsersId:
            json["AspNetUsersId"] == null ? null : json["AspNetUsersId"],
        description: json["Description"] == null ? null : json["Description"],
        horaires: json["Horaires"] == null ? null : json["Horaires"],
        apropos: json["Apropos"] == null ? null : json["Apropos"],
        adresse: json["Adresse"] == null ? null : json["Adresse"],
        contact1: json["Contact1"] == null ? null : json["Contact1"],
        contact2: json["Contact2"] == null ? null : json["Contact2"],
        noms: json["Noms"] == null ? null : json["Noms"],
        prenoms: json["Prenoms"] == null ? null : json["Prenoms"],
        civilite: json["Civilite"] == null ? null : json["Civilite"],
        fonction: json["Fonction"] == null ? null : json["Fonction"],
        photo: json["Photo"] == null ? null : json["Photo"],
        email: json["Email"] == null ? null : json["Email"],
        lat: json["Lat"] == null ? null : json["Lat"],
        longe: json["Longe"] == null ? null : json["Longe"],
        status: json["Status"] == null ? null : json["Status"],
        location: json["Location"] == null ? null : json["Location"],
        note: json["Note"] == null ? null : json["Note"],
        etat: json["Etat"] == null ? null : json["Etat"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "CompagniesId": compagniesId == null ? null : compagniesId,
        "AspNetUsersId": aspNetUsersId == null ? null : aspNetUsersId,
        "Description": description == null ? null : description,
        "Horaires": horaires == null ? null : horaires,
        "Apropos": apropos == null ? null : apropos,
        "Adresse": adresse == null ? null : adresse,
        "Contact1": contact1 == null ? null : contact1,
        "Contact2": contact2 == null ? null : contact2,
        "Noms": noms == null ? null : noms,
        "Prenoms": prenoms == null ? null : prenoms,
        "Civilite": civilite == null ? null : civilite,
        "Fonction": fonction == null ? null : fonction,
        "Photo": photo == null ? null : photo,
        "Email": email == null ? null : email,
        "Lat": lat == null ? null : lat,
        "Longe": longe == null ? null : longe,
        "Status": status == null ? null : status,
        "Location": location == null ? null : location,
        "Note": note == null ? null : note,
        "Etat": etat == null ? null : etat,
      };
}

//Type cars
class ListeHotelNear {
  ListeHotelNear({
    this.id,
    this.compagniesId,
    this.aspNetUsersId,
    this.description,
    this.horaires,
    this.apropos,
    this.adresse,
    this.contact1,
    this.contact2,
    this.noms,
    this.prenoms,
    this.civilite,
    this.fonction,
    this.photo,
    this.email,
    this.lat,
    this.longe,
    this.status,
    this.location,
    this.note,
    this.etat,
  });

  String? id;
  String? compagniesId;
  String? aspNetUsersId;
  String? description;
  String? horaires;
  String? apropos;
  String? adresse;
  String? contact1;
  String? contact2;
  String? noms;
  String? prenoms;
  String? civilite;
  String? fonction;
  String? photo;
  String? email;
  double? lat;
  double? longe;
  String? status;
  String? location;
  String? note;
  String? etat;

  ListeHotelNear copyWith({
    String? id,
    String? compagniesId,
    String? aspNetUsersId,
    String? description,
    String? horaires,
    String? apropos,
    String? adresse,
    String? contact1,
    String? contact2,
    String? noms,
    String? prenoms,
    String? civilite,
    String? fonction,
    String? photo,
    String? email,
    double? lat,
    double? longe,
    String? status,
    String? location,
    String? note,
    String? etat,
  }) =>
      ListeHotelNear(
        id: id ?? this.id,
        description: description ?? this.description,
        etat: etat ?? this.etat,
        photo: photo ?? this.photo,
      );

  factory ListeHotelNear.fromJson(Map<String, dynamic> json) => ListeHotelNear(
        id: json["Id"] == null ? null : json["Id"],
        compagniesId:
            json["CompagniesId"] == null ? null : json["CompagniesId"],
        aspNetUsersId:
            json["AspNetUsersId"] == null ? null : json["AspNetUsersId"],
        description: json["Description"] == null ? null : json["Description"],
        horaires: json["Horaires"] == null ? null : json["Horaires"],
        apropos: json["Apropos"] == null ? null : json["Apropos"],
        adresse: json["Adresse"] == null ? null : json["Adresse"],
        contact1: json["Contact1"] == null ? null : json["Contact1"],
        contact2: json["Contact2"] == null ? null : json["Contact2"],
        noms: json["Noms"] == null ? null : json["Noms"],
        prenoms: json["Prenoms"] == null ? null : json["Prenoms"],
        civilite: json["Civilite"] == null ? null : json["Civilite"],
        fonction: json["Fonction"] == null ? null : json["Fonction"],
        photo: json["Photo"] == null ? null : json["Photo"],
        email: json["Email"] == null ? null : json["Email"],
        lat: json["Lat"] == null ? null : json["Lat"],
        longe: json["Longe"] == null ? null : json["Longe"],
        status: json["Status"] == null ? null : json["Status"],
        location: json["Location"] == null ? null : json["Location"],
        note: json["Note"] == null ? null : json["Note"],
        etat: json["Etat"] == null ? null : json["Etat"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "CompagniesId": compagniesId == null ? null : compagniesId,
        "AspNetUsersId": aspNetUsersId == null ? null : aspNetUsersId,
        "Description": description == null ? null : description,
        "Horaires": horaires == null ? null : horaires,
        "Apropos": apropos == null ? null : apropos,
        "Adresse": adresse == null ? null : adresse,
        "Contact1": contact1 == null ? null : contact1,
        "Contact2": contact2 == null ? null : contact2,
        "Noms": noms == null ? null : noms,
        "Prenoms": prenoms == null ? null : prenoms,
        "Civilite": civilite == null ? null : civilite,
        "Fonction": fonction == null ? null : fonction,
        "Photo": photo == null ? null : photo,
        "Email": email == null ? null : email,
        "Lat": lat == null ? null : lat,
        "Longe": longe == null ? null : longe,
        "Status": status == null ? null : status,
        "Location": location == null ? null : location,
        "Note": note == null ? null : note,
        "Etat": etat == null ? null : etat,
      };
}

//ServicesTypes
class DiscoverseHotel {
  DiscoverseHotel({
    this.id,
    this.compagniesId,
    this.aspNetUsersId,
    this.description,
    this.horaires,
    this.apropos,
    this.adresse,
    this.contact1,
    this.contact2,
    this.noms,
    this.prenoms,
    this.civilite,
    this.fonction,
    this.photo,
    this.email,
    this.lat,
    this.longe,
    this.status,
    this.location,
    this.note,
    this.etat,
  });

  String? id;
  String? compagniesId;
  String? aspNetUsersId;
  String? description;
  String? horaires;
  String? apropos;
  String? adresse;
  String? contact1;
  String? contact2;
  String? noms;
  String? prenoms;
  String? civilite;
  String? fonction;
  String? photo;
  String? email;
  double? lat;
  double? longe;
  String? status;
  String? location;
  String? note;
  String? etat;

  DiscoverseHotel copyWith({
    String? id,
    String? compagniesId,
    String? aspNetUsersId,
    String? description,
    String? horaires,
    String? apropos,
    String? adresse,
    String? contact1,
    String? contact2,
    String? noms,
    String? prenoms,
    String? civilite,
    String? fonction,
    String? photo,
    String? email,
    double? lat,
    double? longe,
    String? status,
    String? location,
    String? note,
    String? etat,
  }) =>
      DiscoverseHotel(
        id: id ?? this.id,
        description: description ?? this.description,
        etat: etat ?? this.etat,
        photo: photo ?? this.photo,
      );

  factory DiscoverseHotel.fromJson(Map<String, dynamic> json) =>
      DiscoverseHotel(
        id: json["Id"] == null ? null : json["Id"],
        compagniesId:
            json["CompagniesId"] == null ? null : json["CompagniesId"],
        aspNetUsersId:
            json["AspNetUsersId"] == null ? null : json["AspNetUsersId"],
        description: json["Description"] == null ? null : json["Description"],
        horaires: json["Horaires"] == null ? null : json["Horaires"],
        apropos: json["Apropos"] == null ? null : json["Apropos"],
        adresse: json["Adresse"] == null ? null : json["Adresse"],
        contact1: json["Contact1"] == null ? null : json["Contact1"],
        contact2: json["Contact2"] == null ? null : json["Contact2"],
        noms: json["Noms"] == null ? null : json["Noms"],
        prenoms: json["Prenoms"] == null ? null : json["Prenoms"],
        civilite: json["Civilite"] == null ? null : json["Civilite"],
        fonction: json["Fonction"] == null ? null : json["Fonction"],
        photo: json["Photo"] == null ? null : json["Photo"],
        email: json["Email"] == null ? null : json["Email"],
        lat: json["Lat"] == null ? null : json["Lat"],
        longe: json["Longe"] == null ? null : json["Longe"],
        status: json["Status"] == null ? null : json["Status"],
        location: json["Location"] == null ? null : json["Location"],
        note: json["Note"] == null ? null : json["Note"],
        etat: json["Etat"] == null ? null : json["Etat"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "CompagniesId": compagniesId == null ? null : compagniesId,
        "AspNetUsersId": aspNetUsersId == null ? null : aspNetUsersId,
        "Description": description == null ? null : description,
        "Horaires": horaires == null ? null : horaires,
        "Apropos": apropos == null ? null : apropos,
        "Adresse": adresse == null ? null : adresse,
        "Contact1": contact1 == null ? null : contact1,
        "Contact2": contact2 == null ? null : contact2,
        "Noms": noms == null ? null : noms,
        "Prenoms": prenoms == null ? null : prenoms,
        "Civilite": civilite == null ? null : civilite,
        "Fonction": fonction == null ? null : fonction,
        "Photo": photo == null ? null : photo,
        "Email": email == null ? null : email,
        "Lat": lat == null ? null : lat,
        "Longe": longe == null ? null : longe,
        "Status": status == null ? null : status,
        "Location": location == null ? null : location,
        "Note": note == null ? null : note,
        "Etat": etat == null ? null : etat,
      };
}

//
class FavorisHotel {
  FavorisHotel({
    this.id,
    this.compagniesId,
    this.aspNetUsersId,
    this.description,
    this.horaires,
    this.apropos,
    this.adresse,
    this.contact1,
    this.contact2,
    this.noms,
    this.prenoms,
    this.civilite,
    this.fonction,
    this.photo,
    this.email,
    this.lat,
    this.longe,
    this.status,
    this.location,
    this.note,
    this.etat,
  });

  String? id;
  String? compagniesId;
  String? aspNetUsersId;
  String? description;
  String? horaires;
  String? apropos;
  String? adresse;
  String? contact1;
  String? contact2;
  String? noms;
  String? prenoms;
  String? civilite;
  String? fonction;
  String? photo;
  String? email;
  double? lat;
  double? longe;
  String? status;
  String? location;
  String? note;
  String? etat;

  FavorisHotel copyWith({
    String? id,
    String? compagniesId,
    String? aspNetUsersId,
    String? description,
    String? horaires,
    String? apropos,
    String? adresse,
    String? contact1,
    String? contact2,
    String? noms,
    String? prenoms,
    String? civilite,
    String? fonction,
    String? photo,
    String? email,
    double? lat,
    double? longe,
    String? status,
    String? location,
    String? note,
    String? etat,
  }) =>
      FavorisHotel(
        id: id ?? this.id,
        description: description ?? this.description,
        etat: etat ?? this.etat,
        photo: photo ?? this.photo,
      );

  factory FavorisHotel.fromJson(Map<String, dynamic> json) => FavorisHotel(
        id: json["Id"] == null ? null : json["Id"],
        compagniesId:
            json["CompagniesId"] == null ? null : json["CompagniesId"],
        aspNetUsersId:
            json["AspNetUsersId"] == null ? null : json["AspNetUsersId"],
        description: json["Description"] == null ? null : json["Description"],
        horaires: json["Horaires"] == null ? null : json["Horaires"],
        apropos: json["Apropos"] == null ? null : json["Apropos"],
        adresse: json["Adresse"] == null ? null : json["Adresse"],
        contact1: json["Contact1"] == null ? null : json["Contact1"],
        contact2: json["Contact2"] == null ? null : json["Contact2"],
        noms: json["Noms"] == null ? null : json["Noms"],
        prenoms: json["Prenoms"] == null ? null : json["Prenoms"],
        civilite: json["Civilite"] == null ? null : json["Civilite"],
        fonction: json["Fonction"] == null ? null : json["Fonction"],
        photo: json["Photo"] == null ? null : json["Photo"],
        email: json["Email"] == null ? null : json["Email"],
        lat: json["Lat"] == null ? null : json["Lat"],
        longe: json["Longe"] == null ? null : json["Longe"],
        status: json["Status"] == null ? null : json["Status"],
        location: json["Location"] == null ? null : json["Location"],
        note: json["Note"] == null ? null : json["Note"],
        etat: json["Etat"] == null ? null : json["Etat"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "CompagniesId": compagniesId == null ? null : compagniesId,
        "AspNetUsersId": aspNetUsersId == null ? null : aspNetUsersId,
        "Description": description == null ? null : description,
        "Horaires": horaires == null ? null : horaires,
        "Apropos": apropos == null ? null : apropos,
        "Adresse": adresse == null ? null : adresse,
        "Contact1": contact1 == null ? null : contact1,
        "Contact2": contact2 == null ? null : contact2,
        "Noms": noms == null ? null : noms,
        "Prenoms": prenoms == null ? null : prenoms,
        "Civilite": civilite == null ? null : civilite,
        "Fonction": fonction == null ? null : fonction,
        "Photo": photo == null ? null : photo,
        "Email": email == null ? null : email,
        "Lat": lat == null ? null : lat,
        "Longe": longe == null ? null : longe,
        "Status": status == null ? null : status,
        "Location": location == null ? null : location,
        "Note": note == null ? null : note,
        "Etat": etat == null ? null : etat,
      };
}

ClientCommande clientCommandeFromJson(String str) =>
    ClientCommande.fromJson(json.decode(str));

String clientCommandeToJson(ClientCommande data) => json.encode(data.toJson());

class ClientCommande {
  ClientCommande({
    this.id,
    this.date,
    this.dateDebut,
    this.dateFin,
    this.dateOnly,
    this.aspNetUsersId,
    this.prixVente,
    this.quantite,
    this.montant,
    this.commission,
    this.etat,
    this.dlat,
    this.dlong,
    this.status,
    this.flat,
    this.flong,
    this.distance,
    this.temps,
    this.depart,
    this.fin,
    this.distanceT,
    this.tempsT,
    this.drdepart,
    this.drlat,
    this.drlong,
    this.drdistance,
    this.drtemps,
    this.drdistanceT,
    this.drtempsT,
    this.type,
    this.contact,
    this.carsId,
    this.providersId,
    this.detailSouscriptionsId,
    this.typepaiements,
    this.vehicule,
    this.client,
    this.laveur,
    this.providers,
    this.detailCommandes,
  });

  String? id;
  DateTime? date;
  DateTime? dateDebut;
  DateTime? dateFin;
  DateTime? dateOnly;
  String? aspNetUsersId;
  String? prixVente;
  String? quantite;
  String? montant;
  int? commission;
  String? etat;
  String? dlat;
  String? dlong;
  String? status;
  String? flat;
  String? flong;
  int? distance;
  int? temps;
  String? depart;
  String? fin;
  String? distanceT;
  String? tempsT;
  String? drdepart;
  String? drlat;
  String? drlong;
  int? drdistance;
  int? drtemps;
  String? drdistanceT;
  String? drtempsT;
  int? type;
  String? contact;
  DateTime? created;
  DateTime? modified;
  String? carsId;
  String? providersId;
  String? detailSouscriptionsId;
  String? typepaiements;
  String? vehicule;
  String? client;
  String? laveur;
  Providers? providers;
  List<DetailCommande>? detailCommandes;

  factory ClientCommande.fromJson(Map<String, dynamic> json) => ClientCommande(
        id: json["Id"],
        date: json["Date"] != null ? DateTime.parse(json["Date"]) : null,
    dateDebut:  json["DateDebut"] != null ? DateTime.parse(json["DateDebut"]) : null,
    dateFin:  json["DateFin"] != null ? DateTime.parse(json["DateFin"]) : null,
        dateOnly: DateTime.parse(json["DateOnly"]),
        aspNetUsersId: json["AspNetUsersId"],
    prixVente: json["PrixVente"].toString().replaceAll(".0", ""),
    quantite: json["Quantite"].toString().replaceAll(".0", ""),
        montant: json["Montant"].toString().replaceAll(".0", ""),
        type: json["Type"],
        contact: json["Contact"],
        providersId: json["ProvidersId"],
        typepaiements: json["Typepaiements"],
        vehicule: json["Vehicule"],
        client: json["Client"],
        laveur: json["Laveur"],
    status: json["Status"],
        providers: Providers.fromJson(json["Providers"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toString(),
    "dateDebut": dateDebut.toString(),
    "dateFin": dateFin.toString(),
        "dateOnly": dateOnly.toString(),
        "aspNetUsersId": aspNetUsersId,
    "prixVente": prixVente,
    "quantite": quantite,
        "montant": montant,
        "commission": commission,
        "etat": etat,
        "dlat": dlat,
        "dlong": dlong,
        "status": status,
        "flat": flat,
        "flong": flong,
        "distance": distance,
        "temps": temps,
        "depart": depart,
        "fin": fin,
        "distanceT": distanceT,
        "tempsT": tempsT,
        "drdepart": drdepart,
        "drlat": drlat,
        "drlong": drlong,
        "drdistance": drdistance,
        "drtemps": drtemps,
        "drdistanceT": drdistanceT,
        "drtempsT": drtempsT,
        "type": type,
        "contact": contact,
        "created": created.toString(),
        "modified": modified.toString(),
        "carsId": carsId,
        "providersId": providersId,
        "detailSouscriptionsId": detailSouscriptionsId,
        "typepaiements": typepaiements,
        "vehicule": vehicule,
        "client": client,
        "laveur": laveur,
        //"providers": providers.toJson(),
        /* "detailCommandes":
            List<dynamic>.from(detailCommandes!.map((x) => x.toJson())),*/
      };
}

class DetailCommande {
  DetailCommande({
    this.id,
    this.providersServicesId,
    this.servicesTypesId,
    this.commandesId,
    this.description,
    this.prixVente,
    this.created,
    this.modified,
    this.etat,
    this.quantite,
    this.providersServices,
  });

  String? id;
  String? providersServicesId;
  String? servicesTypesId;
  String? commandesId;
  String? description;
  int? prixVente;
  DateTime? created;
  DateTime? modified;
  String? etat;
  int? quantite;
  ProvidersService? providersServices;

  factory DetailCommande.fromJson(Map<String, dynamic> json) => DetailCommande(
        id: json["id"],
        providersServicesId: json["providersServicesId"],
        servicesTypesId: json["servicesTypesId"],
        commandesId: json["commandesId"],
        description: json["description"],
        prixVente: json["prixVente"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        etat: json["etat"],
        quantite: json["quantite"],
        providersServices: ProvidersService.fromJson(json["providersServices"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "providersServicesId": providersServicesId,
        "servicesTypesId": servicesTypesId,
        "commandesId": commandesId,
        "description": description,
        "prixVente": prixVente,
        "created": created.toString(),
        "modified": modified.toString(),
        "etat": etat,
        "quantite": quantite,
        "providersServices": providersServices!.toJson(),
      };
}

class ProvidersService {
  ProvidersService({
    this.id,
    this.providersId,
    this.servicesId,
    this.description,
    this.observation,
    this.prixVente,
    this.created,
    this.modified,
    this.etat,
    this.icone,
    this.services,
  });

  String? id;
  String? providersId;
  String? servicesId;
  String? description;
  String? observation;
  String? prixVente;
  DateTime? created;
  DateTime? modified;
  String? etat;
  String? icone;
  Services? services;

  factory ProvidersService.fromJson(Map<String, dynamic> json) =>
      ProvidersService(
        id: json["Id"],
        providersId: json["ProvidersId"],
        servicesId: json["ServicesId"],
        description: json["Description"],
        observation: json["Observation"],
        prixVente: json["PrixVente"].toString().replaceAll(".0", ""),
        /*created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),*/
        etat: json["Etat"],
        icone: json["Icone"],
        //services: Services.fromJson(json["services"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "providersId": providersId,
        "servicesId": servicesId,
        "description": description,
    "observation": observation,
        "prixVente": prixVente,
        "created": created.toString(),
        "modified": modified.toString(),
        "etat": etat,
        "icone": icone,
        "services": services!.toJson(),
      };
}

class Services {
  Services({
    this.id,
    this.description,
    this.prixVente,
    this.created,
    this.modified,
    this.etat,
    this.icone,
  });

  String? id;
  String? description;
  int? prixVente;
  DateTime? created;
  DateTime? modified;
  String? etat;
  String? icone;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        description: json["description"],
        prixVente: json["prixVente"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        etat: json["etat"],
        icone: json["icone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "prixVente": prixVente,
        "created": created.toString(),
        "modified": modified.toString(),
        "etat": etat,
        "icone": icone,
      };
}

class Providers {
  Providers({
    this.id,
    this.compagniesId,
    this.aspNetUsersId,
    this.description,
    this.horaires,
    this.apropos,
    this.adresse,
    this.contact1,
    this.contact2,
    this.noms,
    this.prenoms,
    this.civilite,
    this.fonction,
    this.photo,
    this.email,
    this.lat,
    this.longe,
    this.status,
    this.location,
    this.note,
    this.etat,
    this.created,
    this.modified,
    this.openTime,
    this.closeTime,
    this.providersServices,
    this.installations,
  });

  String? id;
  String? compagniesId;
  String? aspNetUsersId;
  String? description;
  String? horaires;
  String? apropos;
  String? adresse;
  String? contact1;
  String? contact2;
  String? noms;
  String? prenoms;
  String? civilite;
  String? fonction;
  String? photo;
  String? email;
  String? lat;
  String? longe;
  String? status;
  String? location;
  String? note;
  String? etat;
  DateTime? created;
  DateTime? modified;
  DateTime? openTime;
  DateTime? closeTime;
  List<ProvidersService>? providersServices;
  List<Installations>? installations;

  factory Providers.fromJson(Map<String, dynamic> json) => Providers(
    id: json["Id"] == null ? null : json["Id"],
    compagniesId:
    json["CompagniesId"] == null ? null : json["CompagniesId"],
    aspNetUsersId:
    json["AspNetUsersId"] == null ? null : json["AspNetUsersId"],
    description: json["Description"] == null ? null : json["Description"],
    horaires: json["Horaires"] == null ? null : json["Horaires"],
    apropos: json["Apropos"] == null ? null : json["Apropos"],
    adresse: json["Adresse"] == null ? null : json["Adresse"],
    contact1: json["Contact1"] == null ? null : json["Contact1"],
    contact2: json["Contact2"] == null ? null : json["Contact2"],
    noms: json["Noms"] == null ? null : json["Noms"],
    prenoms: json["Prenoms"] == null ? null : json["Prenoms"],
    civilite: json["Civilite"] == null ? null : json["Civilite"],
    fonction: json["Fonction"] == null ? null : json["Fonction"],
    photo: json["Photo"] == null ? null : json["Photo"],
    email: json["Email"] == null ? null : json["Email"],
    lat: json["Lat"] == null ? null : json["Lat"].toString(),
    longe: json["Longe"] == null ? null : json["Longe"].toString(),
    status: json["Status"] == null ? null : json["Status"],
    location: json["Location"] == null ? null : json["Location"],
    note: json["Note"] == null ? null : json["Note"],
    etat: json["Etat"] == null ? null : json["Etat"],

        /*created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        openTime: DateTime.parse(json["openTime"]),
        closeTime: DateTime.parse(json["closeTime"]),*/
        providersServices: List<ProvidersService>.from(
            json["ProvidersServices"] != null ? json["ProvidersServices"].map((x) => ProvidersService.fromJson(x)) : null),
    installations: List<Installations>.from(
        json["Installations"] != null ? json["Installations"].map((x) => Installations.fromJson(x)) : null),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compagniesId": compagniesId,
        "aspNetUsersId": aspNetUsersId,
        "description": description,
        "horaires": horaires,
        "apropos": apropos,
        "adresse": adresse,
        "contact1": contact1,
        "contact2": contact2,
        "noms": noms,
        "prenoms": prenoms,
        "civilite": civilite,
        "fonction": fonction,
        "photo": photo,
        "email": email,
        "lat": lat,
        "longe": longe,
        "status": status,
        "location": location,
        "note": note,
        "etat": etat,
        "created": created.toString(),
        "modified": modified.toString(),
        "openTime": openTime.toString(),
        "closeTime": closeTime.toString(),
        "providersServices":
            List<dynamic>.from(providersServices!.map((x) => x.toJson())),
      };
}

class Installations {
  Installations({
    this.id,
    this.providersId,
    this.amenetiesId,
    this.description,
    this.created,
    this.modified,
    this.etat,
    this.icone,
  });

  String? id;
  String? providersId;
  String? amenetiesId;
  String? description;
  DateTime? created;
  DateTime? modified;
  String? etat;
  String? icone;

  factory Installations.fromJson(Map<String, dynamic> json) =>
      Installations(
        id: json["Id"],
        providersId: json["ProvidersId"],
        amenetiesId: json["AmenetiesId"],
        description: json["Description"],
        etat: json["Etat"],
        icone: json["Icone"],
        //services: Services.fromJson(json["services"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "providersId": providersId,
    "AmenetiesId": amenetiesId,
    "description": description,
    "created": created.toString(),
    "modified": modified.toString(),
    "etat": etat,
    "icone": icone,
  };
}

class User {
  User({
    this.id,
    this.UserName,
    this.Noms,
    this.Email,
    this.Contact1,
  });

  String? id;
  String? UserName;
  String? Noms;
  String? Email;
  String? Contact1;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["Id"],
    UserName: json["UserName"],
    Noms: json["Noms"],
    Email: json["Email"],
    Contact1: json["Contact1"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "UserName": UserName,
    "Noms": Noms,
    "Email": Email,
    "Contact1": Contact1,
  };
}
