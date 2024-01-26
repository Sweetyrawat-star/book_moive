
import 'package:dartz/dartz.dart';
import '../../Data/models/upcoming_moive_details.dart';
import '../../Data/models/upcoming_moives.dart';
import '../../common/exceptions/app_error.dart';
import '../usecase/city_weather_detail_usecase.dart';


abstract class UpComingMoiveReposistory{
  Future<Either<AppError, List<Result>>> getUpComingMoives();
  Future<Either<AppError, UpComingMoiveDetails>> upComingMoiveDetail(MoiveDetails params);

}