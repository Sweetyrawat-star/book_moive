import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../Domain/usecase/city_weather_detail_usecase.dart';
import 'city_weather_detail_state.dart';
part 'city_weather_detail_event.dart';


class CityWeatherDetailBloc extends Bloc<WeatherDetailEvent, CityWeatherDetailState> {
  final CityWeatherDetailUseCase _cityWeatherDetailUseCase;
  CityWeatherDetailBloc(this._cityWeatherDetailUseCase) : super(CityWeatherDetailInitial()) {
    on<WeatherDetailEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(CityWeatherDetailProgress());
        var response = await _cityWeatherDetailUseCase(MoiveDetails(event.id));
        response.fold(
              (l) => emit(CityWeatherDetailFailed(l.message)),
              (r) {
            if (r!.title != null) {
              print(r);
              return emit(
                CityWeatherDetailSuccess(r),

              );
            } else {
              return emit(CityWeatherDetailSuccess(r));
            }
          },
        );
      }
    });
  }
}
