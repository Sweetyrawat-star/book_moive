
abstract class UpComingMoiveVideosState {

}

class UpComingMoiveVideosInitial extends UpComingMoiveVideosState {

}

class UpComingMoiveVideosProgress extends UpComingMoiveVideosState {

}

class UpComingMoiveVideosSuccess extends UpComingMoiveVideosState {
  final List<Map<String, dynamic>>  upComingMoiveVideo;

  UpComingMoiveVideosSuccess(this.upComingMoiveVideo);

}

class UpComingMoiveVideosFailed extends UpComingMoiveVideosState {
  final String? message;

  UpComingMoiveVideosFailed(this.message);
}




