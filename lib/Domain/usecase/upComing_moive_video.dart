
import 'package:book_moive/Data/models/upcoming_moive_vedio.dart';
import 'package:book_moive/Domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../Data/models/upcoming_moive_details.dart';
import '../../common/exceptions/app_error.dart';
import '../repository/repository.dart';

class UpComingMoiveVediosUseCase extends UseCase<UpComingMoiveUrl, MoiveDetailsValue> {
  final  UpComingMoiveReposistory _repo;

  UpComingMoiveVediosUseCase(this._repo);

  @override
  Future<Either<AppError, UpComingMoiveUrl>> call(MoiveDetailsValue params) async {
    return _repo.getUpComingVideos(params);
  }
}
class MoiveDetailsValue {
  final int id;

  MoiveDetailsValue(this.id);

  int idValue(){
    return id;
  }


}