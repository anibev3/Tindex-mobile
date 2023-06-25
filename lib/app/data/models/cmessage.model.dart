import 'dart:convert';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

List<CMessage> cMessageFromMap(String str) =>
    List<CMessage>.from(json.decode(str).map((x) => CMessage.fromMap(x)));

String cMessageToMap(List<CMessage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CMessage {
  CMessage({
    this.created,
    this.updated,
    this.content,
    this.owner,
    this.image,
  });

  DateTime? created;
  DateTime? updated;
  String? content;
  String? owner;
  String? image;

  factory CMessage.fromJson(String str) => CMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CMessage.fromMap(Map<String, dynamic> json) => CMessage(
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        content: json["content"],
        owner: json["owner"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "content": content,
        "owner": owner,
        "image": image,
      };
}
