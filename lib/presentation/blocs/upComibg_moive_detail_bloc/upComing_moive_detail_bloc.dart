import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../Domain/usecase/upComing_moive_detail_usecase.dart';
import 'upComing_moive_Details_state.dart';
part 'upComing_moive_detail_event.dart';


class UpComingMoiveDetailBloc extends Bloc<UpComingMoiveDetailEvent, UpComingMoiveDetailState> {
  final UpComingMoiveDetailUseCase _cityWeatherDetailUseCase;
  UpComingMoiveDetailBloc(this._cityWeatherDetailUseCase) : super(UpComingMoiveDetailInitial()) {
    on<UpComingMoiveDetailEvent>((event, emit) async {
      if (event is FetchUpComingMoiveDetailEvent) {
        emit(UpComingMoiveDetailProgress());
        var response = await _cityWeatherDetailUseCase(MoiveDetails(event.id));
        response.fold(
              (l) => emit(UpComingMoiveDetailFailed(l.message)),
              (r) {
            if (r!.title != null) {
              print(r);
              return emit(
                UpComingMoiveDetailSuccess(r),

              );
            } else {
              return emit(UpComingMoiveDetailSuccess(r));
            }
          },
        );
      }
    });
  }
}
