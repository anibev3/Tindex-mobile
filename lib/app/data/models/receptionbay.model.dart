import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/notification.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

class ReceptionBay {
  ReceptionBay({
    this.collectionId,
    this.collectionName,
    this.created,
    this.expand,
    this.id,
    this.notifications,
    this.owner,
    this.updated,
  });

  String? collectionId;
  String? collectionName;
  DateTime? created;
  ReceptionBayExpand? expand;
  List<Notification>? notifications;
  String? id;
  String? owner;
  DateTime? updated;

  factory ReceptionBay.fromJson(String str) =>
      ReceptionBay.fromMap(json.decode(str));

  factory ReceptionBay.fromRecord(RecordModel record) =>
      ReceptionBay.fromMap(record.toJson());

  String toJson() => json.encode(toMap());

  factory ReceptionBay.fromMap(Map<String, dynamic> json) => ReceptionBay(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        expand: json["expand"] == null
            ? null
            : ReceptionBayExpand.fromMap(json["expand"]),
        id: json["id"],
        notifications: json["notifications"] == null
            ? []
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromMap(x))),
        owner: json["owner"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "expand": expand == null ? null : expand!.toMap(),
        "id": id,
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications!.map((x) => x)),
        "owner": owner,
        "updated": DateHelper.format(updated),
      };
}

class ReceptionBayExpand {
  ReceptionBayExpand({
    this.owner,
  });

  Utilisateur? owner;

  factory ReceptionBayExpand.fromJson(String str) =>
      ReceptionBayExpand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReceptionBayExpand.fromMap(Map<String, dynamic> json) =>
      ReceptionBayExpand(
        owner:
            json["owner"] == null ? null : Utilisateur.fromMap(json["owner"]),
      );

  Map<String, dynamic> toMap() => {
        "owner": owner == null ? null : owner!.toMap(),
      };
}
