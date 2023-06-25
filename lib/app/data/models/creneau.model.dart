// import 'dart:convert';

// import 'package:intl/intl.dart';

// Utilisateur utilisateurFromJson(String str) =>
//     Utilisateur.fromJson(json.decode(str));

// String utilisateurToJson(Utilisateur data) => json.encode(data.toJson());

// class Utilisateur {
//   Utilisateur({
//     this.id,
//     this.collectionId,
//     this.collectionName,
//     this.created,
//     this.updated,
//     this.username,
//     this.verified,
//     this.emailVisibility,
//     this.email,
//     this.nom,
//     this.prenoms,
//     this.avatar,
//     this.enable,
//     this.roles,
//   });

//   String? id;
//   String? collectionId;
//   String? collectionName;
//   DateTime? created;
//   DateTime? updated;
//   String? username;
//   bool? verified;
//   bool? emailVisibility;
//   String? email;
//   String? nom;
//   String? prenoms;
//   String? avatar;
//   bool? enable;
//   List<String>? roles;

//   factory Utilisateur.fromJson(Map<String, dynamic> json) => Utilisateur(
//         id: json["id"],
//         collectionId: json["collectionId"],
//         collectionName: json["collectionName"],
//         created: DateTime.parse(json["created"]),
//         updated: DateTime.parse(json["updated"]),
//         username: json["username"],
//         verified: json["verified"],
//         emailVisibility: json["emailVisibility"],
//         email: json["email"],
//         nom: json["nom"],
//         prenoms: json["prenoms"],
//         avatar: json["avatar"],
//         enable: json["enable"],
//         roles: List<String>.from(json["roles"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "collectionId": collectionId,
//         "collectionName": collectionName,
//         "created": DateFormat("yyyy-MM-dd HH:mm:ss").format(created!),
//         "updated": DateFormat("yyyy-MM-dd HH:mm:ss").format(updated!),
//         "username": username,
//         "verified": verified,
//         "emailVisibility": emailVisibility,
//         "email": email,
//         "nom": nom,
//         "prenoms": prenoms,
//         "avatar": avatar,
//         "enable": enable,
//         "roles":
//             roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
//       };
// }
