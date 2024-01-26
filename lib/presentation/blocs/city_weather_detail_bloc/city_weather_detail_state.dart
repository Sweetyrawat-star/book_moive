

import '../../../Data/models/city_weather_detail_model.dart';
import '../../../Data/models/upcoming_moive_details.dart';

abstract class CityWeatherDetailState {

}

class CityWeatherDetailInitial extends CityWeatherDetailState {

}

class CityWeatherDetailProgress extends CityWeatherDetailState {

}

class CityWeatherDetailSuccess extends CityWeatherDetailState {
  final UpComingMoiveDetails cityWeatherEntity;

  CityWeatherDetailSuccess(this.cityWeatherEntity);

}

class CityWeatherDetailFailed extends CityWeatherDetailState {
  final String? message;

  CityWeatherDetailFailed(this.message);
}




