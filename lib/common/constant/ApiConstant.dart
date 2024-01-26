

import '../../Domain/usecase/city_weather_detail_usecase.dart';

class ApiConstant {
  //342cb8abeb31176d16fe40544a86df59

 // https://api.themoviedb.org/t/p/original/
  //https://api.themoviedb.org/3/movie/upcoming?api_key=342cb8abeb31176d16fe40544a86df59
  //https://api.themoviedb.org/3/movie/787699?api_key=342cb8abeb31176d16fe40544a86df59
  static const String key = '342cb8abeb31176d16fe40544a86df59';
  //static const String key = 'af232e5ca6994dd9df0799e6e786d1e8';
  static const String baseUrl = 'https://api.themoviedb.org';
  //static const String baseUrl = 'https://api.openweathermap.org';
  static const String upcomingMoive = "/3/movie/upcoming?api_key=$key";
  static const String weatherOfCityDetailUrl = "/data/2.5/weather?lat=35.0125&lon=34.0583&appid=$key";
  static const String weatherOfCity = "/data/2.5/group?id=18918,703448,1261481,1172451,14256,2643743&units;=metric&appid=$key";

  static  getParameter(MoiveDetails params){
    return "/3/movie/${params.idValue()}?api_key=$key";

  }
}

