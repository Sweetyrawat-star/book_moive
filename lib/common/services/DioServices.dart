//
//
// import 'package:blocex/Data/models/user_model.dart';
// import 'package:blocex/common/constant/ApiConstant.dart';
// import 'package:dio/dio.dart';
//
// class DioClient {
//   final Dio _dio = Dio();
//
// // TODO: Add methods
//   Future<PostModel> getUser({required String id}) async {
//     // Perform GET request to the endpoint "/users/<id>"
//     Response userData = await _dio.get(ApiConstant.postUrl + ApiConstant.param);
//     // Prints the raw data returned by the server
//     print('User Info: ${userData.data}');
//     // Parsing the raw JSON data to the User class
//     PostModel user = PostModel.fromJson(userData.data);
//     return user;
//   }
// }