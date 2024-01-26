
import '../../../Data/models/upcoming_moive_images_model.dart';
import '../../../Data/models/upcoming_moive_vedio.dart';

abstract class UpComingMoiveVideosState {

}

class UpComingMoiveVideosInitial extends UpComingMoiveVideosState {

}

class UpComingMoiveVideosProgress extends UpComingMoiveVideosState {

}

class UpComingMoiveVideosSuccess extends UpComingMoiveVideosState {
  final UpComingMoiveUrl upComingMoiveImages;

  UpComingMoiveVideosSuccess(this.upComingMoiveImages);

}

class UpComingMoiveVideosFailed extends UpComingMoiveVideosState {
  final String? message;

  UpComingMoiveVideosFailed(this.message);
}




