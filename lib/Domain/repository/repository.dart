
import 'package:book_moive/Data/models/upcoming_moive_images_model.dart';
import 'package:book_moive/Domain/usecase/upComing_moive_video.dart';
import 'package:dartz/dartz.dart';
import '../../Data/models/upcoming_moive_details.dart';
import '../../Data/models/upcoming_moive_vedio.dart';
import '../../Data/models/upcoming_moives.dart';
import '../../common/exceptions/app_error.dart';
import '../usecase/upComing_moive_Images_usecase.dart';
import '../usecase/upComing_moive_detail_usecase.dart';


abstract class UpComingMoiveReposistory{
  Future<Either<AppError, List<Result>>> getUpComingMoives();
  Future<Either<AppError, UpComingMoiveUrl>> getUpComingVideos(MoiveDetailsValue params);
  Future<Either<AppError, UpComingMoiveDetails>> upComingMoiveDetail(MoiveDetails params);
  Future<Either<AppError, UpComingMoiveImagesDetails >> upComingMoiveImages(MoiveDetailsId params);

}