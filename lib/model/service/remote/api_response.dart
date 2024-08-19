import 'package:dio/dio.dart';

class ApiResponse {
  final Response? response;
  dynamic error;

  ApiResponse(this.error, this.response);

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;

  ApiResponse.withError(dynamic errorValue)
      : error = errorValue,
        response = null;
}
