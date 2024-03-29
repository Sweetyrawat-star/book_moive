
import 'package:bloc/bloc.dart';
import '../../../Domain/usecase/upComing_moive_Images_usecase.dart';
import 'upComing_moive_images_state.dart';
part 'upComing_moive_images_event.dart';

class UpComingMoiveImagelBloc
    extends Bloc<UpComingMoiveVideoEvent, UpComingMoiveImagesState> {
  final UComingMoiveDetailImagesUseCase _cityWeatherDetailUseCase;
  UpComingMoiveImagelBloc(this._cityWeatherDetailUseCase)
      : super(UpComingMoiveImageInitial()) {
    on<UpComingMoiveVideoEvent>((event, emit) async {
      if (event is FetchUpComingMoiveImagesEvent) {
        emit(UpComingMoiveImageProgress());
        var response =
            await _cityWeatherDetailUseCase(MoiveDetailsId(event.id));
        response.fold(
          (l) => emit(UpComingMoiveImageFailed(l.message)),
          (r) {
            print(r);
            return emit(
              UpComingMoiveImageSuccess(r),
            );
          },
        );
      }
    });
  }
}
