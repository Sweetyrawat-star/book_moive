
import 'package:book_moive/Domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../Data/models/upcoming_moive_details.dart';
import '../../common/exceptions/app_error.dart';
import '../repository/repository.dart';

class UpComingMoiveDetailUseCase extends UseCase<UpComingMoiveDetails, MoiveDetails> {
  final  UpComingMoiveReposistory _repo;

  UpComingMoiveDetailUseCase(this._repo);

  @override
  Future<Either<AppError, UpComingMoiveDetails>> call(MoiveDetails params) async {
    return _repo.upComingMoiveDetail(params);
  }
}
class MoiveDetails {
  final int id;

  MoiveDetails(this.id);

  int idValue(){
    return id;
  }


}
