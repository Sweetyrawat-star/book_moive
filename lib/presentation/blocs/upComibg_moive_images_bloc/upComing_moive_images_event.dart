part of 'upComing_moive_images_bloc.dart';

abstract class UpComingMoiveVideoEvent {}

class FetchUpComingMoiveVideosEvent extends UpComingMoiveVideoEvent  {
  final int id;
  FetchUpComingMoiveVideosEvent(this.id,);
}