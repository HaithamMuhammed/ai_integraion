// dio_helper.dart
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com/v1/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: query,
        options: options,
      );
      print('Request URL: ${dio.options.baseUrl}$url');
      print('Query Parameters: $query');
      print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio Error: $e');
      rethrow;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: data,
        options: options,
      );
      print('POST Request URL: ${dio.options.baseUrl}$url');
      print('POST Data: $data');
      print('POST Query Params: $query');
      print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio POST Error: $e');
      rethrow;
    }
  }

  static Future<Response> postFormData({
    required String url,
    required FormData formData,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: formData,
        options: options,
      );
      print('POST FormData URL: ${dio.options.baseUrl}$url');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio FormData POST Error: $e');
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: query,
      );
      print('PUT Request URL: ${dio.options.baseUrl}$url');
      print('PUT Data: $data');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio PUT Error: $e');
      rethrow;
    }
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: query,
      );
      print('DELETE Request URL: ${dio.options.baseUrl}$url');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio DELETE Error: $e');
      rethrow;
    }
  }
}
