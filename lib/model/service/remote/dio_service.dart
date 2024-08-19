import 'dart:developer';

import 'package:fitness_tracking_app/model/service/helper/token_helper.dart';
import 'package:dio/dio.dart';

class DioService{
  static final DioService _singleton=DioService._internal();
  late final Dio _dio;
  final TokenService _tokenService=TokenService();


  factory DioService(){
    return _singleton;
  }
  DioService._internal(){
    setup();
  }
  Future<void> setup() async{
    try{
      String? bearerToken= await _tokenService.getToken()??null;
      final headers={
        'Content-type':'application/json',
      };
      if(bearerToken != null){
        headers['Authorization']='Bearer $bearerToken';
      }

      _dio=Dio(
          BaseOptions(
              baseUrl: '',
              headers: headers,
              validateStatus: (v){
                if(v== null){
                  return false;
                }else{
                  return v<500;
                }
              },

          ),
      );
      _dio.interceptors.add(LogInterceptor(
          request: true,requestHeader: true,responseHeader: true,requestBody: true,responseBody: true
      )
      );
      log('Dio setup with base URL: ${_dio.options.baseUrl}');
      log('Bearer Token $bearerToken');
      log('Headers: $headers');
    }catch(e){
      log('Error in Dio Setup $e');
    }
  }

  Future<Response?> post(String path,{Map<String,dynamic>? queryParameter})async{
    try{
      final response=await _dio.post(path,queryParameters: queryParameter);
      return response;
    }on FormatException{
      throw const FormatException('Unable to Process your Request at this moment');
    }catch (e){
      log('Error in post req:$e');
      rethrow;
    }
  }

  Future<Response?> get(String path, {Map<String, dynamic>? queryParameter}) async{
  try{
    var response=await _dio.get(path,queryParameters: queryParameter);
    return response;
  }on FormatException {
    throw const FormatException('Unable to Process your Request at this moment');
  } catch(e){
    log('Error in get request:$e');
    rethrow ;
  }
  }
}