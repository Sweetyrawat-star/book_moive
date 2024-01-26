
import '../../../Data/models/upcoming_moive_details.dart';

abstract class UpComingMoiveDetailState {

}

class UpComingMoiveDetailInitial extends UpComingMoiveDetailState {

}

class UpComingMoiveDetailProgress extends UpComingMoiveDetailState {

}

class UpComingMoiveDetailSuccess extends UpComingMoiveDetailState {
  final UpComingMoiveDetails upComingMoiveEntity;

  UpComingMoiveDetailSuccess(this.upComingMoiveEntity);

}

class UpComingMoiveDetailFailed extends UpComingMoiveDetailState {
  final String? message;

  UpComingMoiveDetailFailed(this.message);
}




