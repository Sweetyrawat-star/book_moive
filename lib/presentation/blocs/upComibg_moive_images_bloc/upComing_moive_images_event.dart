part of 'upComing_moive_images_bloc.dart';

abstract class UpComingMoiveVideoEvent {}

class FetchUpComingMoiveImagesEvent extends UpComingMoiveVideoEvent  {
  final int id;
  FetchUpComingMoiveImagesEvent(this.id,);
}