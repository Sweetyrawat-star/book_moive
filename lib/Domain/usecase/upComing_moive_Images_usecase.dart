
import 'package:book_moive/Data/models/upcoming_moive_images_model.dart';
import 'package:book_moive/Domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../common/exceptions/app_error.dart';
import '../repository/repository.dart';

class UComingMoiveDetailImagesUseCase extends UseCase<UpComingMoiveImagesDetails , MoiveDetailsId> {
  final  UpComingMoiveReposistory _repo;

  UComingMoiveDetailImagesUseCase(this._repo);

  @override
  Future<Either<AppError, UpComingMoiveImagesDetails >> call(MoiveDetailsId params) async {
    return _repo.upComingMoiveImages(params);
  }
}
class MoiveDetailsId {
  final int id;

  MoiveDetailsId(this.id);

  int idValue(){
    return id;
  }


}
