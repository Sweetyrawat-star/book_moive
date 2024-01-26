

import 'package:book_moive/Domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../Data/models/upcoming_moives.dart';
import '../../common/exceptions/app_error.dart';
import '../repository/repository.dart';

class CityWeatherUseCase extends UseCase<List<Result>, NoParams> {
  final  UpComingMoiveReposistory _repo;

  CityWeatherUseCase(this._repo);

  @override
  Future<Either<AppError, List<Result>>> call(NoParams params) async {
    return _repo.getUpComingMoives();
  }
}
