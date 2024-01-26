part of 'upComing_moive_videos_bloc.dart';

abstract class UpComingMoiveVideoEvent {}

class FetchUpComingMoiveVideosEvent extends UpComingMoiveVideoEvent  {
  final int id;
  FetchUpComingMoiveVideosEvent(this.id,);
}