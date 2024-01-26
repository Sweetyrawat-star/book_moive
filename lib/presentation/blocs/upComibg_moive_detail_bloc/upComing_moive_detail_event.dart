part of 'upComing_moive_detail_bloc.dart';

abstract class UpComingMoiveDetailEvent {}

class FetchUpComingMoiveDetailEvent extends UpComingMoiveDetailEvent  {
  final int id;
  FetchUpComingMoiveDetailEvent(this.id,);
}
