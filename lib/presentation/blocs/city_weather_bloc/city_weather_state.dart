part of 'city_weather_bloc.dart';

@immutable
abstract class UpComingMoiveState {
  final List<Result> upcomingMoiveEntity;
  UpComingMoiveState(this.upcomingMoiveEntity);
}

class UpComingMoiveInitial extends UpComingMoiveState {
  UpComingMoiveInitial(List<Result> placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class UpComingMoiveProgress extends UpComingMoiveState {
  UpComingMoiveProgress(List<Result> placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class UpComingMoiveSuccess extends UpComingMoiveState {
  final List<Result> placeHolderUserEntity;

  UpComingMoiveSuccess(this.placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class UpComingMoiveFailed extends UpComingMoiveState {
  final String? message;

  UpComingMoiveFailed(this.message) : super([]);
}

