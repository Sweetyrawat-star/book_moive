

import '../../Domain/usecase/upComing_moive_Images_usecase.dart';
import '../../Domain/usecase/upComing_moive_detail_usecase.dart';
import '../../Domain/usecase/upComing_moive_video.dart';

class ApiConstant {
  //342cb8abeb31176d16fe40544a86df59

 // https://api.themoviedb.org/t/p/original/
  //https://api.themoviedb.org/3/movie/upcoming?api_key=342cb8abeb31176d16fe40544a86df59
  //https://api.themoviedb.org/3/movie/787699/images?api_key=342cb8abeb31176d16fe40544a86df59

  //https://api.themoviedb.org/3/movie/787699?api_key=342cb8abeb31176d16fe40544a86df59

  static const String key = '342cb8abeb31176d16fe40544a86df59';
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String upcomingMoive = "/3/movie/upcoming?api_key=$key";
  static  getParameter(MoiveDetails params){
    return "/3/movie/${params.idValue()}?api_key=$key";

  }
  static  getMoiveImages(MoiveDetailsId params){
    return "/3/movie/${params.idValue()}/images?api_key=$key";

  }
  static  getMoiveVideos(MoiveDetailsValue params){
    return "/3/movie/${params.idValue()}/Videos?api_key=$key";

  }
}

