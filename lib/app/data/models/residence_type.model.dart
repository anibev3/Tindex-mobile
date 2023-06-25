import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<ResidenceType> listeResidenceTypeFromRecord(List<RecordModel> data) =>
    List<ResidenceType>.from(data.map((x) => ResidenceType.fromRecord(x)));

class ResidenceType {
  ResidenceType({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.libelle,
  });

  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? libelle;

  factory ResidenceType.fromJson(String str) =>
      ResidenceType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResidenceType.fromRecord(RecordModel record) =>
      ResidenceType.fromMap(record.toJson());

  factory ResidenceType.fromMap(Map<String, dynamic> json) => ResidenceType(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        libelle: json["libelle"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "libelle": libelle,
      };
}
