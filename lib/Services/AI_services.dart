import 'package:dio/dio.dart';

class AIService {
  final Dio _dio = Dio();

  Future<int?> predictTennis(List<int> features) async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:5001/predict',
        data: {"features": [1, 0, 1, 1]},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        print('Response from AI: ${response.data}');
        return response.data['prediction'];
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
