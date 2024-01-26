// To parse this JSON data, do
//
//     final upComingMoive = upComingMoiveFromJson(jsonString);

import 'dart:convert';

UpComingMoive upComingMoiveFromJson(String str) => UpComingMoive.fromJson(json.decode(str));

String upComingMoiveToJson(UpComingMoive data) => json.encode(data.toJson());

class UpComingMoive {
  Dates ?dates;
  int ?page;
  List<Result> ?results;
  int ?totalPages;
  int ?totalResults;

  UpComingMoive({
    this.dates,
     this.page,
     this.results,
    this.totalPages,
    this.totalResults,
  });

  factory UpComingMoive.fromJson(Map<String, dynamic> json) => UpComingMoive(
    dates: Dates.fromJson(json["dates"]),
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "dates": dates?.toJson(),
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Dates {
  DateTime ?maximum;
  DateTime ?minimum;

  Dates({
     this.maximum,
     this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toJson() => {
    "maximum": "${maximum?.year.toString().padLeft(4, '0')}-${maximum?.month.toString().padLeft(2, '0')}-${maximum?.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum?.year.toString().padLeft(4, '0')}-${minimum?.month.toString().padLeft(2, '0')}-${minimum?.day.toString().padLeft(2, '0')}",
  };
}

class Result {
  bool ?adult;
  String ?backdropPath;
  List<int> ?genreIds;
  int ?id;
  String ?originalLanguage;
  String ?originalTitle;
  String ?overview;
  double ?popularity;
  String ?posterPath;
  DateTime ?releaseDate;
  String ?title;
  bool ?video;
  double ?voteAverage;
  int ?voteCount;

  Result({
     this.adult,
     this.backdropPath,
     this.genreIds,
     this.id,
     this.originalLanguage,
     this.originalTitle,
     this.overview,
     this.popularity,
     this.posterPath,
     this.releaseDate,
     this.title,
     this.video,
     this.voteAverage,
     this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}
