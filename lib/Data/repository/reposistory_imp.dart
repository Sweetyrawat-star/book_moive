import 'dart:io';
import 'package:book_moive/Data/models/upcoming_moive_details.dart';
import 'package:book_moive/Data/models/upcoming_moive_images_model.dart';
import 'package:dartz/dartz.dart';


import '../../Domain/repository/repository.dart';
import '../../Domain/usecase/upComing_moive_Images_usecase.dart';
import '../../Domain/usecase/upComing_moive_detail_usecase.dart';
import '../../Domain/usecase/upComing_moive_video.dart';
import '../../common/exceptions/app_error.dart';
import '../../common/exceptions/app_exception.dart';
import '../models/upcoming_moive_vedio.dart';
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
  Future<Either<AppError,List<Map<String, dynamic>> >> getUpComingVideos(MoiveDetailsValue params) async {
    try{
      var _response = await _remoteDataSource.getUpComingMoivesVideos(params);
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
  @override
  Future<Either<AppError,UpComingMoiveImagesDetails >> upComingMoiveImages(MoiveDetailsId params) async {
    try {
      var _response = await _remoteDataSource.upComingMoiveImages(params);
      return Right(_response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on AppException catch (e) {
      return Left(AppError(AppErrorType.api, message: e.message));
    }
  }
}