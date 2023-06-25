import 'dart:convert';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/residence.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<Favoris> listefavorisFromMap(String str) =>
    List<Favoris>.from(json.decode(str).map((x) => Favoris.fromMap(x)));

List<Favoris> listefavorisFromRecord(List<RecordModel> data) =>
    List<Favoris>.from(data.map((x) => Favoris.fromRecord(x)));

class Favoris {
  Favoris({
    this.collectionId,
    this.collectionName,
    this.created,
    this.enable,
    this.expand,
    this.id,
    this.residence,
    this.updated,
    this.utilisateur,
  });

  String? collectionId;
  String? collectionName;
  DateTime? created;
  bool? enable;
  FavorisExpand? expand;
  String? id;
  String? residence;
  DateTime? updated;
  String? utilisateur;

  //  ----------------------------------------------------------------

  Residence? getResidence() {
    if (expand != null && expand?.residence != null) {
      return expand!.residence;
    }
    return null;
  }

  // ----------------------------------------------------------------

  factory Favoris.fromJson(String str) => Favoris.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Favoris.fromRecord(RecordModel record) =>
      Favoris.fromMap(record.toJson());

  factory Favoris.fromMap(Map<String, dynamic> json) => Favoris(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        enable: json["enable"],
        expand: json["expand"] == null
            ? null
            : FavorisExpand.fromMap(json["expand"]),
        id: json["id"],
        residence: json["residence"],
        updated: DateTime.parse(json["updated"]),
        utilisateur: json["utilisateur"],
      );

  Map<String, dynamic> toMap() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "enable": enable,
        "id": id,
        "residence": residence,
        "updated": DateHelper.format(updated),
        "utilisateur": utilisateur,
      };
}

class FavorisExpand {
  FavorisExpand({
    this.residence,
    this.utilisateur,
  });

  Residence? residence;
  Utilisateur? utilisateur;

  factory FavorisExpand.fromJson(String str) =>
      FavorisExpand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavorisExpand.fromMap(Map<String, dynamic> json) => FavorisExpand(
        residence: json["residence"] == null
            ? null
            : Residence.fromMap(json["residence"]),
        utilisateur: json["utilisateur"] == null
            ? null
            : Utilisateur.fromMap(json["utilisateur"]),
      );

  Map<String, dynamic> toMap() => {
        "residence": residence == null ? null : residence!.toMap(),
        "utilisateur": utilisateur == null ? null : utilisateur!.toMap(),
      };
}
