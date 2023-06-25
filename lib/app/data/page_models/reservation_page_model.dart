import 'dart:convert';

import 'package:tindex_mobile/app/data/models/intervaldate.model.dart';

List<ReservationPageModel> reservationPageModelFromMap(String str) =>
    List<ReservationPageModel>.from(
        json.decode(str).map((x) => ReservationPageModel.fromMap(x)));

String reservationPageModelToMap(List<ReservationPageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ReservationPageModel {
  ReservationPageModel({
    this.residenceID,
    this.interval,
  });

  String? residenceID;
  IntervalDate? interval;

  factory ReservationPageModel.fromMap(Map<String, dynamic> json) =>
      ReservationPageModel(
        residenceID: json["residenceID"],
        interval: json["interval"],
      );

  Map<String, dynamic> toMap() => {
        "residenceID": residenceID,
        "interval": interval,
      };
}
