
import 'package:dio/dio.dart';


import '../constant/ApiConstant.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,

      ),
    );
  }

  Future<Response> getRequest({endpoint, header}) async {
    Response response;
    Map<String, dynamic> headerWithoutToken = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    try {
      response = await _dio.get(endpoint,
          options: Options(headers: headerWithoutToken));
        return response;
    } catch (e) {
      String statusMessage;
      int statusCode;
      if (e is DioException) {
        if (e.response!.statusCode == 403) {
          RequestOptions requestOptions = e.requestOptions;
          _dio.options.headers["language"] = "1";
          _dio.options.headers["Accept"] = "*/*";
          final response = await _dio.request(requestOptions.path,
              options: Options(method: requestOptions.method),
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          statusMessage = "Request Timeout";
          statusCode = 408;
        } else if (e.error == DioExceptionType.receiveTimeout) {
          statusMessage = "No data received";
          statusCode = 408;
        } else {
          statusMessage = e.message!;
          statusCode = 0;
        }
        response = Response(
          statusMessage: statusMessage,
          statusCode: statusCode,
          requestOptions: RequestOptions(path: endpoint),
        );
      } else {
        response = Response(
          statusMessage: e.toString(),
          requestOptions: RequestOptions(path: endpoint),
        );
      }
    }
    return response;
  }
}
