import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<Notification> listeNotificationFromMap(String str) =>
    List<Notification>.from(
        json.decode(str).map((x) => Notification.fromMap(x)));

List<Notification> listeNotificationFromRecord(List<RecordModel> data) =>
    List<Notification>.from(data.map((x) => Notification.fromRecord(x)));

class Notification {
  Notification({
    this.content,
    this.created,
    this.id,
    this.title,
    this.type,
    this.status,
    this.updated,
  });

  String? content;
  DateTime? created;
  int? id;
  String? title;
  String? type;
  String? status;
  DateTime? updated;

  factory Notification.fromJson(String str) =>
      Notification.fromMap(json.decode(str));

  factory Notification.fromRecord(RecordModel record) =>
      Notification.fromMap(record.toJson());

  String toJson() => json.encode(toMap());

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
        content: json["content"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        title: json["title"],
        type: json["type"],
        status: json["status"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "created": DateHelper.format(created),
        "id": id,
        "title": title,
        "type": type,
        "status": status,
        "updated": DateHelper.format(updated),
      };
}
