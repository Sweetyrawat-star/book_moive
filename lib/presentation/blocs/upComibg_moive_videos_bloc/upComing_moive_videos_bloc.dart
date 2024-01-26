
import 'package:bloc/bloc.dart';
import 'package:book_moive/Domain/usecase/upComing_moive_video.dart';
import '../../../Domain/usecase/upComing_moive_Images_usecase.dart';
import 'upComing_moive_videos_state.dart';
part 'upComing_moive_videos_event.dart';

class UpComingMoiveVideoBloc
    extends Bloc<UpComingMoiveVideoEvent, UpComingMoiveVideosState> {
  final UpComingMoiveVediosUseCase _cityWeatherDetailUseCase;
  UpComingMoiveVideoBloc(this._cityWeatherDetailUseCase)
      : super(UpComingMoiveVideosInitial()) {
    on<UpComingMoiveVideoEvent>((event, emit) async {
      if (event is FetchUpComingMoiveVideosEvent) {
        emit(UpComingMoiveVideosProgress());
        var response =
            await _cityWeatherDetailUseCase(MoiveDetailsValue(event.id));
        response.fold(
          (l) => emit(UpComingMoiveVideosFailed(l.message)),
          (r) {
            print(r);
            return emit(
              UpComingMoiveVideosSuccess(r),
            );
          },
        );
      }
    });
  }
}
