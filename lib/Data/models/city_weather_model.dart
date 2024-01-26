// To parse this JSON data, do
//
//     final weatherOfCity = weatherOfCityFromJson(jsonString);

import 'dart:convert';

WeatherOfCity weatherOfCityFromJson(String str) => WeatherOfCity.fromJson(json.decode(str));

String weatherOfCityToJson(WeatherOfCity data) => json.encode(data.toJson());

class WeatherOfCity {
  int cnt;
  List<ListElement> list;

  WeatherOfCity({
    required this.cnt,
    required this.list,
  });

  factory WeatherOfCity.fromJson(Map<String, dynamic> json) => WeatherOfCity(
    cnt: json["cnt"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cnt": cnt,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  Coord coord;
  Sys sys;
  List<Weather> weather;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  int id;
  String name;

  ListElement({
    required this.coord,
    required this.sys,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.id,
    required this.name,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    coord: Coord.fromJson(json["coord"]),
    sys: Sys.fromJson(json["sys"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main: Main.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "sys": sys.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "main": main.toJson(),
    "visibility": visibility,
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "id": id,
    "name": name,
  };
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
  };
}

class Sys {
  String country;
  int timezone;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    country: json["country"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  double speed;
  int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}
