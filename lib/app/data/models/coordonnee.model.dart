import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coordonnee {
  Coordonnee({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Coordonnee.fromJson(String str) =>
      Coordonnee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  LatLng toPoint() {
    return LatLng(lat!, lng!);
  }

  factory Coordonnee.fromMap(Map<String, dynamic> json) => Coordonnee(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}
