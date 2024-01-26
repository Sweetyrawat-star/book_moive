// To parse this JSON data, do
//
//     final upComingMoiveUrl = upComingMoiveUrlFromJson(jsonString);

import 'dart:convert';

UpComingMoiveUrl upComingMoiveUrlFromJson(String str) => UpComingMoiveUrl.fromJson(json.decode(str));

String upComingMoiveUrlToJson(UpComingMoiveUrl data) => json.encode(data.toJson());

class UpComingMoiveUrl {
  int id;
  List<ResultData> results;

  UpComingMoiveUrl({
    required this.id,
    required this.results,
  });

  factory UpComingMoiveUrl.fromJson(Map<String, dynamic> json) => UpComingMoiveUrl(
    id: json["id"],
    results: List<ResultData>.from(json["results"].map((x) => ResultData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ResultData {
  Iso6391 iso6391;
  Iso31661 iso31661;
  String name;
  String key;
  Site site;
  int size;
  String type;
  bool official;
  DateTime publishedAt;
  String id;

  ResultData({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
    iso6391: iso6391Values.map[json["iso_639_1"]]!,
    iso31661: iso31661Values.map[json["iso_3166_1"]]!,
    name: json["name"],
    key: json["key"],
    site: siteValues.map[json["site"]]!,
    size: json["size"],
    type: json["type"],
    official: json["official"],
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391Values.reverse[iso6391],
    "iso_3166_1": iso31661Values.reverse[iso31661],
    "name": name,
    "key": key,
    "site": siteValues.reverse[site],
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt.toIso8601String(),
    "id": id,
  };
}

enum Iso31661 {
  US
}

final iso31661Values = EnumValues({
  "US": Iso31661.US
});

enum Iso6391 {
  EN
}

final iso6391Values = EnumValues({
  "en": Iso6391.EN
});

enum Site {
  YOU_TUBE
}

final siteValues = EnumValues({
  "YouTube": Site.YOU_TUBE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
