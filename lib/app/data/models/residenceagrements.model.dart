import 'dart:convert';

class Residenceagrements {
  Residenceagrements({
    this.chambre,
    this.douche,
    this.superficie,
    this.jardin,
    this.garage,
    this.garageNb,
    this.cuisine,
    this.terasse,
    this.piscine,
    this.clim,
    this.wifi,
    this.tv,
  });

  int? chambre;
  int? douche;
  int? superficie;
  bool? jardin;
  bool? garage;
  int? garageNb;
  int? cuisine;
  bool? terasse;
  bool? piscine;
  bool? clim;
  bool? wifi;
  bool? tv;

  factory Residenceagrements.fromJson(String str) =>
      Residenceagrements.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Residenceagrements.fromMap(Map<String, dynamic> json) =>
      Residenceagrements(
        chambre: json["chambre"],
        douche: json["douche"],
        superficie: json["superficie"],
        jardin: json["jardin"],
        clim: json["clim"],
        wifi: json["wifi"],
        tv: json["tv"],
        garage: json["garage"],
        garageNb: json["garage_nb"],
        cuisine: json["cuisine"],
        terasse: json["terasse"],
        piscine: json["piscine"],
      );

  Map<String, dynamic> toMap() => {
        "chambre": chambre ?? 0,
        "douche": douche ?? 0,
        "clim": clim ?? false,
        "wifi": wifi ?? false,
        "tv": tv ?? false,
        "superficie": superficie ?? 0,
        "jardin": jardin ?? false,
        "garage": garage ?? false,
        "garage_nb": garageNb ?? 0,
        "cuisine": cuisine ?? 0,
        "terasse": terasse ?? false,
        "piscine": piscine ?? false,
      };
}
