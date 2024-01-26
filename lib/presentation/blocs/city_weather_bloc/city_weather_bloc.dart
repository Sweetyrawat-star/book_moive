import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/models/city_weather_model.dart';
import '../../../Data/models/upcoming_moives.dart';
import '../../../Domain/usecase/cityWeatherUseCase.dart';
import '../../../Domain/usecase/usecase.dart';


part 'city_weather_event.dart';
part 'city_weather_state.dart';

class UpComingMoiveBloc extends Bloc<UpCominMoiveEvent, UpComingMoiveState> {
  final CityWeatherUseCase _cityWeatherUseCase;
  UpComingMoiveBloc(this._cityWeatherUseCase) : super(UpComingMoiveInitial([])) {
    on<UpCominMoiveEvent>((event, emit) async {
      if (event is CityEvent) {
        emit(UpComingMoiveProgress([]));
        var response = await _cityWeatherUseCase(NoParams());
        response.fold(
              (l) => emit(UpComingMoiveFailed(l.message)),
              (r) {
            if (r.first.title != null) {
              return emit(
                UpComingMoiveSuccess(r),
              );
            } else {
              return emit(UpComingMoiveSuccess([]));
            }
          },
        );
      }
    });
  }
}
