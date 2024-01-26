
import '../../../Data/models/upcoming_moive_images_model.dart';

abstract class UpComingMoiveImagesState {

}

class UpComingMoiveImageInitial extends UpComingMoiveImagesState {

}

class UpComingMoiveImageProgress extends UpComingMoiveImagesState {

}

class UpComingMoiveImageSuccess extends UpComingMoiveImagesState {
  final UpComingMoiveImagesDetails upComingMoiveImages;

  UpComingMoiveImageSuccess(this.upComingMoiveImages);

}

class UpComingMoiveImageFailed extends UpComingMoiveImagesState {
  final String? message;

  UpComingMoiveImageFailed(this.message);
}




