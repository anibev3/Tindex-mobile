import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/residence.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<Commentaire> listeCommentaireFromMap(String str) =>
    List<Commentaire>.from(json.decode(str).map((x) => Commentaire.fromMap(x)));

List<Commentaire> listeCommentaireFromRecord(List<RecordModel> data) =>
    List<Commentaire>.from(data.map((x) => Commentaire.fromRecord(x)));

class Commentaire {
  Commentaire({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.commentaire,
    this.note,
    this.user,
    this.residence,
    this.expand,
  });

  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? commentaire;
  double? note;
  String? user;
  String? residence;
  CommentaireExpand? expand;

  String getAuteur() {
    String auteur = "No one";
    if (expand != null && expand?.user != null) {
      return "${(expand?.user?.nom)!} ${(expand?.user?.prenoms)!}";
    }
    return auteur;
  }

  String getDateDePost() {
    String date = "Septembre 2022";
    if (created != null) {
      return DateHelper.byformat(created)!;
    }
    return date;
  }

  String getAvatar() {
    String avatar = "";
    if (expand != null &&
        expand?.user != null &&
        expand?.user?.avatar != null) {
      return (expand?.user?.avatar)!;
    }
    return avatar;
  }

  factory Commentaire.fromRecord(RecordModel record) =>
      Commentaire.fromMap(record.toJson());

  factory Commentaire.fromJson(String str) =>
      Commentaire.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Commentaire.fromMap(Map<String, dynamic> json) => Commentaire(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        commentaire: json["commentaire"],
        note: double.tryParse("${json["note"]}"),
        user: json["user"],
        residence: json["residence"],
        expand: json["expand"] == null
            ? null
            : CommentaireExpand.fromMap(json["expand"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "commentaire": commentaire,
        "note": note,
        "user": user,
        "residence": residence,
      };
}

class CommentaireExpand {
  CommentaireExpand({
    // this.commune,
    this.user,
    this.residence,
  });

  Utilisateur? user;
  Residence? residence;

  factory CommentaireExpand.fromJson(String str) =>
      CommentaireExpand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentaireExpand.fromMap(Map<String, dynamic> json) =>
      CommentaireExpand(
        user: json["user"] == null ? null : Utilisateur.fromMap(json["user"]),
        residence: json["residence"] == null
            ? null
            : Residence.fromMap(json["residence"]),
      );

  Map<String, dynamic> toMap() => {
        // "commune": commune == null ? null : commune!.toMap(),
        "user": user == null ? null : user!.toMap(),
        "residence": residence == null ? null : residence!.toMap(),
      };
}
