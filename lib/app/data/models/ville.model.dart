// import 'dart:convert';

// import 'package:mobile/app/utils/helpers/date.helper.dart';

// class Ville {
//   Ville({
//     this.collectionId,
//     this.collectionName,
//     this.created,
//     this.description,
//     this.id,
//     this.libelle,
//     this.updated,
//   });

//   String? collectionId;
//   String? collectionName;
//   DateTime? created;
//   String? description;
//   String? id;
//   String? libelle;
//   DateTime? updated;

//   factory Ville.fromJson(String str) => Ville.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Ville.fromMap(Map<String, dynamic> json) => Ville(
//         collectionId: json["collectionId"],
//         collectionName: json["collectionName"],
//         created: DateTime.parse(json["created"]),
//         description: json["description"],
//         id: json["id"],
//         libelle: json["libelle"],
//         updated: DateTime.parse(json["updated"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "collectionId": collectionId,
//         "collectionName": collectionName,
//         "created": DateHelper.format(created),
//         "description": description,
//         "id": id,
//         "libelle": libelle,
//         "updated": DateHelper.format(updated),
//       };
// }
