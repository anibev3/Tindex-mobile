import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/cmessage.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

class Conversation {
  Conversation({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.acteur1,
    this.acteur2,
    this.messages,
  });

  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? acteur1;
  String? acteur2;
  List<CMessage>? messages;

  factory Conversation.fromJson(String str) =>
      Conversation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Conversation.fromRecord(RecordModel record) =>
      Conversation.fromMap(record.toJson());

  factory Conversation.fromMap(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        acteur1: json["acteur1"],
        acteur2: json["acteur2"],
        messages: json["messages"] == null
            ? null
            : List.from(json["messages"]
                .map((el) => CMessage.fromJson(jsonEncode(el)))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "acteur1": acteur1,
        "acteur2": acteur2,
        "messages": messages,
      };
}
