import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';

class Utilisateur {
  Utilisateur({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.username,
    this.verified,
    this.emailVisibility,
    this.email,
    this.nom,
    this.password,
    this.passwordConfirm,
    this.prenoms,
    this.otp,
    this.avatar,
    this.isactive,
    this.enable,
    this.roles,
    this.contact,
  });

  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? username;
  bool? verified;
  bool? emailVisibility;
  String? password;
  String? passwordConfirm;
  String? email;
  String? nom;
  String? prenoms;
  String? otp;
  String? avatar;
  bool? enable;
  bool? isactive;
  List<String>? roles;
  String? contact;

  factory Utilisateur.fromJson(String str) =>
      Utilisateur.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromRecord(RecordModel record) =>
      Utilisateur.fromMap(record.toJson());

  factory Utilisateur.fromMap(Map<String, dynamic> json) => Utilisateur(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        username: json["username"],
        verified: json["verified"],
        emailVisibility: json["emailVisibility"],
        email: json["email"],
        nom: json["nom"],
        prenoms: json["prenoms"],
        avatar: json["avatar"],
        enable: json["enable"],
        isactive: json["isactive"],
        otp: json["otp"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        contact: json["contact"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created == null
            ? null
            : DateFormat("yyyy-MM-dd HH:mm:ss").format(created!),
        "updated": updated == null
            ? null
            : DateFormat("yyyy-MM-dd HH:mm:ss").format(updated!),
        "username": username,
        "verified": verified,
        "emailVisibility": emailVisibility,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "nom": nom,
        "prenoms": prenoms,
        "avatar": avatar,
        "otp": otp,
        "enable": enable,
        "isactive": isactive,
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "contact": contact,
      };
}
