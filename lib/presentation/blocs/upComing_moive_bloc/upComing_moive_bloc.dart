import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../Data/models/upcoming_moives.dart';
import '../../../Domain/usecase/upComing_moive_UseCase.dart';
import '../../../Domain/usecase/usecase.dart';


part 'upComing_moive_event.dart';
part 'upComing_moive_state.dart';

class UpComingMoiveBloc extends Bloc<UpCominMoiveEvent, UpComingMoiveState> {
  final CityWeatherUseCase _cityWeatherUseCase;
  UpComingMoiveBloc(this._cityWeatherUseCase) : super(UpComingMoiveInitial([])) {
    on<UpCominMoiveEvent>((event, emit) async {
      if (event is UpComingMoiveImageEvent) {
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
