import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/residenceagrements.model.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

class Parametre {
  Parametre({
    this.id,
    this.created,
    this.updated,
    this.collectionId,
    this.collectionName,
    this.typeagrements,
    this.typefacturation,
  });

  String? id;
  DateTime? created;
  DateTime? updated;
  String? collectionId;
  String? collectionName;

  Residenceagrements? typeagrements;
  String? typefacturation;

  factory Parametre.fromRecord(RecordModel record) =>
      Parametre.fromMap(record.toJson());

  factory Parametre.fromMap(Map<String, dynamic> json) => Parametre(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        typeagrements: json["typeagrements"] == null
            ? null
            : Residenceagrements.fromMap(json["typeagrements"]),
        typefacturation: json["typefacturation"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created": DateHelper.format(created),
        "updated": DateHelper.format(updated),
        "collectionId": collectionId,
        "collectionName": collectionName,
        "typeagrements": typeagrements == null ? null : typeagrements!.toMap(),
        "typefacturation": typefacturation,
      };
}
