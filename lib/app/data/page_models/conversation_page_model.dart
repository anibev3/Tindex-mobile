import 'dart:convert';

List<ConversationPageModel> conservationPageModelFromMap(String str) =>
    List<ConversationPageModel>.from(
        json.decode(str).map((x) => ConversationPageModel.fromMap(x)));

String conversationPageModelToMap(List<ConversationPageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ConversationPageModel {
  ConversationPageModel({
    this.senderID,
    this.ownerID,
  });

  String? senderID;
  String? ownerID;

  factory ConversationPageModel.fromMap(Map<String, dynamic> json) =>
      ConversationPageModel(
        senderID: json["senderID"],
        ownerID: json["ownerID"],
      );

  Map<String, dynamic> toMap() => {
        "senderID": senderID,
        "ownerID": ownerID,
      };
}
