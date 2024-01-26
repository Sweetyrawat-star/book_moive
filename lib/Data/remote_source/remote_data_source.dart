
import 'dart:convert';

import 'package:dio/dio.dart';
import '../../Domain/usecase/city_weather_detail_usecase.dart';
import '../../common/constant/ApiConstant.dart';
import '../../common/services/dio_client.dart';
import '../models/city_weather_detail_model.dart';
import '../models/city_weather_model.dart';
import '../models/upcoming_moive_details.dart';
import '../models/upcoming_moives.dart';

abstract class RemoteDataSource {
  Future<List<Result>> getUpComingMoives();
  Future<UpComingMoiveDetails> upComingMoiveDetail(MoiveDetails params);
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


}