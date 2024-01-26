
import 'dart:convert';

import 'package:book_moive/Data/models/upcoming_moive_vedio.dart';
import 'package:book_moive/Domain/usecase/upComing_moive_Images_usecase.dart';
import 'package:dio/dio.dart';
import '../../Domain/usecase/upComing_moive_detail_usecase.dart';
import '../../Domain/usecase/upComing_moive_video.dart';
import '../../common/constant/ApiConstant.dart';
import '../../common/services/dio_client.dart';
import '../models/upcoming_moive_details.dart';
import '../models/upcoming_moive_images_model.dart';
import '../models/upcoming_moives.dart';

abstract class RemoteDataSource {
  Future<List<Result>> getUpComingMoives();
  Future<UpComingMoiveUrl> getUpComingMoivesVideos(MoiveDetailsValue params);
  Future<UpComingMoiveDetails> upComingMoiveDetail(MoiveDetails params);
  Future<UpComingMoiveImagesDetails > upComingMoiveImages(MoiveDetailsId params);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final DioClient _dioClient;

  RemoteDataSourceImpl(this._dioClient);


  Future<List<Result>> getUpComingMoives() async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.upcomingMoive);
    List<Result> _data = [];
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> responseData = _response.data as Map<String, dynamic>;
      List<dynamic> data = responseData['results'] as List<dynamic>;
      for (var listData in data) {
        _data.add(Result.fromJson(listData));
      }
      return _data;
    } else {
      throw Exception(_response.statusMessage);
    }
  }
  Future<UpComingMoiveUrl> getUpComingMoivesVideos(MoiveDetailsValue params) async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.getMoiveVideos(params));
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      final dynamicData = _response.data as Map<String,dynamic>;
      print(dynamicData);
      final upComingMoiveDetails = UpComingMoiveUrl.fromJson(dynamicData);
      return upComingMoiveDetails;

    } else {
      throw Exception(_response.statusMessage);
    }
  }
  Future<UpComingMoiveDetails> upComingMoiveDetail(MoiveDetails params) async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.getParameter(params));
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      //final Map<String,dynamic> jsonMap = (json.decode(_response.data.toString())) as Map<String,dynamic>;
      final dynamicData = _response.data as Map<String,dynamic>;
      print(dynamicData);
      final upComingMoiveDetails = UpComingMoiveDetails.fromJson(dynamicData);
      return upComingMoiveDetails;
    } else {
      throw Exception(_response.statusMessage);
    }
  }
  Future<UpComingMoiveImagesDetails > upComingMoiveImages(MoiveDetailsId params) async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.getMoiveImages(params));
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      //final Map<String,dynamic> jsonMap = (json.decode(_response.data.toString())) as Map<String,dynamic>;
      final dynamicData = _response.data as Map<String,dynamic>;
      print(dynamicData);
      final upComingMoiveImages= UpComingMoiveImagesDetails .fromJson(dynamicData);
      print("====Datw===$upComingMoiveImages");
      return upComingMoiveImages;
    } else {
      throw Exception(_response.statusMessage);
    }
  }


}