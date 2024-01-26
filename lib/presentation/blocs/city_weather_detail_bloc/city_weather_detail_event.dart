part of 'city_weather_detail_bloc.dart';

abstract class WeatherDetailEvent {}

class FetchWeatherEvent extends WeatherDetailEvent  {
  final int id;
  FetchWeatherEvent(this.id,);
}