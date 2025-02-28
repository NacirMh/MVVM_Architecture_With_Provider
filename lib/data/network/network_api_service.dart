import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_example/data/app_exceptions.dart';

class NetworkApiService{
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
    ),
  );

  
  Future<dynamic> getGetApiResponse(String url) async {
    if (kDebugMode) {
      print("GET: $url");
    }
    try {
      final response = await _dio.get(url);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    if (kDebugMode) {
      print("POST: $url");
      print("Data: $data");
    }
    try {
      final response = await _dio.post(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> getPutApiResponse(String url, dynamic data) async {
    if (kDebugMode) {
      print("PUT: $url");
      print("Data: $data");
    }
    try {
      final response = await _dio.put(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> getDeleteApiResponse(String url) async {
    if (kDebugMode) {
      print("DELETE: $url");
    }
    try {
      final response = await _dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
      throw FetchDataException("Network Request timed out");
    } else if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      switch (statusCode) {
        case 400:
          throw BadRequestException(responseData.toString());
        case 401:
        case 403:
          throw UnauthorisedException(responseData.toString());
        case 404:
          throw FetchDataException("Resource not found");
        case 500:
          throw FetchDataException("Internal server error");
        default:
          throw FetchDataException("Unexpected error: ${e.message}");
      }
    } else if (e.type == DioExceptionType.connectionError) {
      throw NoInternetException("No Internet Connection");
    } else {
      throw FetchDataException("Something went wrong: ${e.message}");
    }
  }
}