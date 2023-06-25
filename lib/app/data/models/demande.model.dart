import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/residence.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<Demande> listedemandeFromRecord(List<RecordModel> data) =>
    List<Demande>.from(data.map((x) => Demande.fromRecord(x)));

class Demande {
  Demande({
    this.id,
    this.created,
    this.updated,
    this.collectionId,
    this.collectionName,
    this.arrivee,
    this.client,
    this.depart,
    this.duree,
    this.enable,
    this.nombrePersonne,
    this.residence,
    this.statut,
    this.prix,
    this.expand,
  });

  String? id;
  DateTime? created;
  DateTime? updated;
  String? collectionId;
  String? collectionName;
  DateTime? arrivee;
  String? client;
  DateTime? depart;
  int? duree;
  bool? enable;
  int? nombrePersonne;
  int? prix;
  String? residence;
  String? statut;
  DemandeExpand? expand;

  factory Demande.fromJson(String str) => Demande.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Demande.fromRecord(RecordModel record) =>
      Demande.fromMap(record.toJson());

  //  ----------------------------------------------------------------

  Residence? getResidence() {
    if (expand != null && expand?.residence != null) {
      return expand!.residence;
    }
    return null;
  }

  Utilisateur? getClient() {
    if (expand != null && expand?.client != null) {
      return expand!.client;
    }
    return null;
  }

  // ----------------------------------------------------------------

  factory Demande.fromMap(Map<String, dynamic> json) => Demande(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        arrivee: DateTime.parse(json["arrivee"]),
        client: json["client"],
        depart: DateTime.parse(json["depart"]),
        duree: json["duree"],
        enable: json["enable"],
        nombrePersonne: json["nombre_personne"],
        prix: json["prix"],
        residence: json["residence"],
        statut: json["statut"],
        expand: json["expand"] == null
            ? null
            : DemandeExpand.fromMap(json["expand"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "collectionId": collectionId,
        "collectionName": collectionName,
        "arrivee": DateHelper.format(arrivee),
        "client": client,
        "depart": DateHelper.format(depart),
        "duree": duree,
        "prix": prix,
        "enable": enable,
        "statut": statut,
        "nombre_personne": nombrePersonne,
        "residence": residence,
      };
}

class DemandeExpand {
  DemandeExpand({
    this.client,
    this.residence,
  });

  Utilisateur? client;
  Residence? residence;

  factory DemandeExpand.fromJson(String str) =>
      DemandeExpand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DemandeExpand.fromMap(Map<String, dynamic> json) => DemandeExpand(
        client:
            json["client"] == null ? null : Utilisateur.fromMap(json["client"]),
        residence: json["residence"] == null
            ? null
            : Residence.fromMap(json["residence"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client == null ? null : client!.toMap(),
        "residence": residence == null ? null : residence!.toMap(),
      };
}
