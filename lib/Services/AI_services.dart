// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class AIService {
  final Dio _dio = Dio();

  Future<int?> predictTennis(List<int> features) async {
    try {
      print('Sending features to AI: $features');

      final response = await _dio.post(
        'http://10.0.2.2:5001/predict',
        data: {"features": features},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print('Response from AI: $data');

        if (data != null && data.containsKey('prediction')) {
          return data['prediction'] as int;
        } else {
          print('Prediction key missing in response.');
          return null;
        }
      } else {
        print('Error from server: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Request error: $e');
      return null;
    }
  }
}
