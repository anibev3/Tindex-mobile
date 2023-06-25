// import 'dart:convert';
// import 'package:mobile/app/data/models/coordonnee.model.dart';
// import 'package:mobile/app/data/models/ville.model.dart';
// import 'package:mobile/app/utils/helpers/date.helper.dart';
// import 'package:pocketbase/pocketbase.dart';

// class Commune {
//   Commune({
//     this.centercoordonnees,
//     this.collectionId,
//     this.collectionName,
//     this.created,
//     this.description,
//     this.id,
//     this.libelle,
//     this.updated,
//   });

//   Coordonnee? centercoordonnees;
//   String? collectionId;
//   String? collectionName;
//   DateTime? created;
//   String? description;
//   String? id;
//   String? libelle;
//   DateTime? updated;
//   CommuneExpand? expand;

//   factory Commune.fromJson(String str) => Commune.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Commune.fromRecord(RecordModel record) =>
//       Commune.fromMap(record.toJson());

//   factory Commune.fromMap(Map<String, dynamic> json) => Commune(
//         centercoordonnees: json["centercoordonnees"] == null
//             ? null
//             : Coordonnee.fromMap(json["centercoordonnees"]),
//         collectionId: json["collectionId"],
//         collectionName: json["collectionName"],
//         created: DateTime.parse(json["created"]),
//         description: json["description"],
//         id: json["id"],
//         libelle: json["libelle"],
//         updated: DateTime.parse(json["updated"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "centercoordonnees":
//             centercoordonnees == null ? null : centercoordonnees!.toJson(),
//         "collectionId": collectionId,
//         "collectionName": collectionName,
//         "created": DateHelper.format(created),
//         "description": description,
//         "id": id,
//         "libelle": libelle,
//         "updated": DateHelper.format(updated),
//       };
// }

// class CommuneExpand {
//   CommuneExpand({this.ville});
//   Ville? ville;

//   factory CommuneExpand.fromJson(String str) =>
//       CommuneExpand.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory CommuneExpand.fromMap(Map<String, dynamic> json) =>
//       CommuneExpand(ville: Ville.fromMap(json["commune"]));

//   Map<String, dynamic> toMap() => {
//         "ville": ville == null ? null : ville!.toMap(),
//       };
// }
