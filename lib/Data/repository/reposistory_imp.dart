import 'dart:io';
import 'package:book_moive/Data/models/upcoming_moive_details.dart';
import 'package:dartz/dartz.dart';


import '../../Domain/repository/repository.dart';
import '../../Domain/usecase/city_weather_detail_usecase.dart';
import '../../common/exceptions/app_error.dart';
import '../../common/exceptions/app_exception.dart';
import '../models/city_weather_detail_model.dart';
import '../models/city_weather_model.dart';
import '../models/upcoming_moives.dart';
import '../remote_source/remote_data_source.dart';

class PostUserReposistoryImpl implements UpComingMoiveReposistory{
  RemoteDataSource _remoteDataSource;
  PostUserReposistoryImpl(this._remoteDataSource);


  @override
  Future<Either<AppError, List<Result>>> getUpComingMoives() async {
    try{
      var _response = await _remoteDataSource.getUpComingMoives();
      return Right(_response);
    }on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on AppException catch (e) {
      return Left(AppError(AppErrorType.api, message: e.message));
    }
  }

  @override
  Future<Either<AppError,UpComingMoiveDetails>> upComingMoiveDetail(MoiveDetails params) async {
    try {
      var _response = await _remoteDataSource.upComingMoiveDetail(params);
      return Right(_response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on AppException catch (e) {
      return Left(AppError(AppErrorType.api, message: e.message));
    }
  }
}