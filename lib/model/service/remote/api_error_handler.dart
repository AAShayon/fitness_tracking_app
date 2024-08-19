
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiErrorHandler{
  static dynamic getErrorMessage(error){
    dynamic errorMessage = '';
    if(error is Exception){
    log('Error is Exception');
  try{
    if(error is DioException){
      log('Error is DioException');
      log('Check error Type in :${error.type}');
      switch(error.type){

        case DioExceptionType.connectionTimeout:
          errorMessage='connectionTimeout';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage='sendTimeout';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage='receiveTimeout';
          break;
        case DioExceptionType.badCertificate:
          errorMessage='badCertificate';
          break;
        case DioExceptionType.badResponse:
          errorMessage='badResponse';
          break;
        case DioExceptionType.cancel:
          errorMessage='cancel';
          break;
        case DioExceptionType.connectionError:
          errorMessage='connectionError';
          break;
        case DioExceptionType.unknown:
        errorMessage='unknown';
        break;
      }
    }
    else{
      errorMessage='Unexpected Error Come';
    }
  }on FormatException catch(e){
    errorMessage="$e is a Format Exception";
  }
    }
    else{
      errorMessage='This is Not a Subtype of error';
    }
    return errorMessage;
  }




}