import 'dart:convert';

List<IntervalDate> intervalDateFromMap(String str) => List<IntervalDate>.from(
    json.decode(str).map((x) => IntervalDate.fromMap(x)));

String intervalDateToMap(List<IntervalDate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class IntervalDate {
  IntervalDate({
    this.start,
    this.end,
  });

  DateTime? start;
  DateTime? end;

  factory IntervalDate.fromMap(Map<String, dynamic> json) => IntervalDate(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toMap() => {
        "start": start,
        "end": end,
      };
}
