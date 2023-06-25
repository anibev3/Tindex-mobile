import 'dart:convert';

// import 'package:mobile/app/data/models/commune.model.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/coordonnee.model.dart';
import 'package:tindex_mobile/app/data/models/residence_type.model.dart';
import 'package:tindex_mobile/app/data/models/residenceagrements.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<Residence> listeResidenceFromMap(String str) =>
    List<Residence>.from(json.decode(str).map((x) => Residence.fromMap(x)));

List<Residence> listeResidenceFromRecord(List<RecordModel> data) =>
    List<Residence>.from(data.map((x) => Residence.fromRecord(x)));

class Residence {
  Residence({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.residencelibelle,
    this.residencedescription,
    this.residencehonoraire,
    this.residenceimages,
    this.residenceagrements,
    this.coordonnees,
    this.adresse,
    this.proprietaire,
    this.residenceregles,
    this.residenceenable,
    this.activated,
    this.reservations,
    this.residencemindays,
    this.noteGlobale,
    this.nbAvis,
    this.residencetype,
    this.expand,
  });

  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? residencelibelle;
  String? residencedescription;
  int? residencehonoraire;
  List<String>? residenceimages;
  Residenceagrements? residenceagrements;
  Coordonnee? coordonnees;
  // String? commune;
  String? residencetype;
  String? proprietaire;

  String? adresse;
  String? residenceregles;
  bool? residenceenable;
  bool? activated;
  String? reservations;
  int? residencemindays;
  double? noteGlobale;
  double? nbAvis;
  ResidenceExpand? expand;

  factory Residence.fromJson(String str) => Residence.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  String getLocation() {
    String location = "";
    if (adresse != null) {
      location = adresse!;
    }

    // if (expand != null) {
    //   if (expand?.commune != null) {
    //     location = (expand!.commune?.libelle)!;
    //   }

    //   if (expand?.commune != null && expand?.commune?.expand != null) {
    //     CommuneExpand coExpand = (expand?.commune?.expand)!;
    //     if (coExpand.ville != null) {
    //       location += ", ${coExpand.ville?.libelle}";
    //     }
    //   }
    // }
    return location;
  }

  Utilisateur? getProprietaire() {
    Utilisateur user;
    if (expand != null && expand?.proprietaire != null) {
      return (expand?.proprietaire);
    }
    return null;
  }

  String? getFirstImage() {
    return residenceimages == null || residenceimages!.isEmpty
        ? null
        : residenceimages![0];
  }

  String getResidenceType() {
    String residenceType = "Maison";
    if (expand != null && expand?.residencetype != null) {
      return (expand?.residencetype?.libelle)!;
    }
    return residenceType;
  }

  factory Residence.fromRecord(RecordModel record) =>
      Residence.fromMap(record.toJson());

  factory Residence.fromMap(Map<String, dynamic> json) => Residence(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        residencelibelle: json["residencelibelle"],
        residencedescription: json["residencedescription"],
        residencehonoraire: json["residencehonoraire"],
        residenceimages: json["residenceimages"] == null
            ? []
            : List.from(json["residenceimages"].map((el) => el.toString())),
        residenceagrements: json["residenceagrements"] == null
            ? null
            : Residenceagrements.fromMap(json["residenceagrements"]),
        coordonnees: json["coordonnees"] == null
            ? null
            : Coordonnee.fromMap(json["coordonnees"]),
        // commune: json["commune"],
        proprietaire: json["proprietaire"],
        adresse: json["adresse"],
        residenceregles: json["residenceregles"],
        residencetype: json["residencetype"],
        residenceenable: json["residenceenable"],
        activated: json["activated"],
        reservations: json["reservations"],
        residencemindays: json["residencemindays"],
        noteGlobale: json["note_globale"] == null
            ? 0.0
            : json["note_globale"].toDouble(),
        nbAvis: json["nb_avis"] == null ? 0.0 : json["nb_avis"].toDouble(),
        expand: json["expand"] == null
            ? null
            : ResidenceExpand.fromMap(json["expand"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "residencelibelle": residencelibelle,
        "residencedescription": residencedescription,
        "residencehonoraire": residencehonoraire,
        "residenceimages": residenceimages,
        "residenceagrements": residenceagrements,
        "coordonnees": coordonnees?.toJson(),
        // "commune": commune,
        "adresse": adresse,
        "proprietaire": proprietaire,
        "residenceregles": residenceregles,
        "residencetype": residencetype,
        "residenceenable": residenceenable,
        "activated": activated,
        "reservations": reservations,
        "residencemindays": residencemindays,
        "note_globale": noteGlobale,
        "nb_avis": nbAvis,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Residence && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ResidenceExpand {
  ResidenceExpand({
    // this.commune,
    this.proprietaire,
    this.residencetype,
  });

  // Commune? commune;
  Utilisateur? proprietaire;
  ResidenceType? residencetype;

  factory ResidenceExpand.fromJson(String str) =>
      ResidenceExpand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResidenceExpand.fromMap(Map<String, dynamic> json) => ResidenceExpand(
        // commune:
        //     json["commune"] == null ? null : Commune.fromMap(json["commune"]),
        proprietaire: json["proprietaire"] == null
            ? null
            : Utilisateur.fromMap(json["proprietaire"]),
        residencetype: json["residencetype"] == null
            ? null
            : ResidenceType.fromMap(json["residencetype"]),
      );

  Map<String, dynamic> toMap() => {
        // "commune": commune == null ? null : commune!.toMap(),
        "proprietaire": proprietaire == null ? null : proprietaire!.toMap(),
        "residencetype": residencetype == null ? null : residencetype!.toMap(),
      };
}
